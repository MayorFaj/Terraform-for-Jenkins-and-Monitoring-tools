## AWS-Instance

resource "aws_instance" "Jenkins-server" {
  ami                         = data.aws_ami.Ubuntu.id
  instance_type               = var.instance
  subnet_id                   = aws_subnet.CGR-Subnet.id
  availability_zone           = data.aws_availability_zones.available.names[0]
  vpc_security_group_ids      = [aws_security_group.Jenkins-CGR-Sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_pair

  launch_template {
    id      = aws_launch_template.Jenkins-launch-template.id
    version = "$Latest"
  }


  tags = merge(
    var.tags,
    {
      Name = "Jenkins"
    },
  )
}

resource "aws_instance" "Prometheus-Grafana-Server" {
  ami                         = data.aws_ami.Ubuntu.id
  instance_type               = var.instance
  subnet_id                   = aws_subnet.CGR-Subnet.id
  availability_zone           = data.aws_availability_zones.available.names[0]
  vpc_security_group_ids      = [aws_security_group.Prometheus-CGR-Sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_pair


  tags = merge(
    var.tags,
    {
      Name = "Prometheus/Grafana"
    },
  )
}