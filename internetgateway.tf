
#-----Internet-gateway
resource "aws_internet_gateway" "CGR-IGW" {
  vpc_id = aws_vpc.CGR_VPC.id

  tags = merge(
    var.tags,
    {
      Name = "CGR-IGW"
    },
  )
}

