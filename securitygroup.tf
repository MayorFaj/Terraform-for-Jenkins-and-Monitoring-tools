resource "aws_security_group" "Jenkins-CGR-Sg" {
  name        = "Jenkins-CGR-Sg"
  description = "Allow Jenkins inbound traffic"
  vpc_id      = aws_vpc.CGR_VPC.id

  #allow access to jenkins from browser
  ingress {
    description = "allow access to port 8080 from anywhere"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "allow access to port 80 from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #allow ssh access to jenkins
  ingress {
    description = "allow access to port 8080 from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "Jenkins-CGR-Sg"
    },
  )
}



resource "aws_security_group" "Prometheus-CGR-Sg" {
  name        = "Prometheus-CGR-Sg"
  description = "Allow Monitoring inbound traffic"
  vpc_id      = aws_vpc.CGR_VPC.id

  #allow access to Prometheus from browser
  ingress {
    description = "allow access to port 9090 from anywhere"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #open port for alertmanager 
  ingress {
    description = "allow access to port 9093 from anywhere"
    from_port   = 9093
    to_port     = 9093
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #allow access to Grafana from browser
  ingress {
    description = "allow access to port 9100 from anywhere"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #allow ssh access to jenkins
  ingress {
    description = "allow access to port 8080 from my machine ip"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "CGR-Monitor-Sg"
    },
  )
}