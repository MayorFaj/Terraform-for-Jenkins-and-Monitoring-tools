resource "aws_launch_template" "Jenkins-launch-template" {
  image_id               = data.aws_ami.Ubuntu.id
  instance_type          = var.instance

  iam_instance_profile {
    name = aws_iam_instance_profile.ip.id
  }

  key_name = var.key_pair

  placement {
    availability_zone = "data.aws_availability_zones.available.names[0]"
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.tags,
      {
        Name = "jenkins-launch-template"
      },
    )
  }

  user_data = filebase64("${path.module}/jenkins.sh")
}