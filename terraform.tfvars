
aws_region = "eu-central-1"

vpc_cidr = "172.16.0.0/16"

pub-subnet-cidr = "172.16.1.0/24"

tags = {
  Environment     = "dev"
  Department      = "Development"
  Owner-Email     = "mayorfaj.io@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "953523290929"
}

key_pair = "pal-key"

instance = "t2.large"
