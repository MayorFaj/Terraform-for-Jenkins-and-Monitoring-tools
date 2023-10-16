

#--- aws-vpc
resource "aws_vpc" "CGR_VPC" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    var.tags,
    {
      Name = "main-vpc"
    },
  )
}

data "aws_availability_zones" "available" {
  state = "available"
}

#---aws-subnet
resource "aws_subnet" "CGR-Subnet" {
  vpc_id                  = aws_vpc.CGR_VPC.id
  cidr_block              = var.pub-subnet-cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = merge(
    var.tags,
    {
      Name = "CGR-Pub-Sub"
    },
  )
}

#--- AMI
data "aws_ami" "Ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

