
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.8"
#     }
#   }
# }

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = ">= 1.1.7"
  backend "s3" {
    bucket = "cgr-staging-terraform-bucket"
    key    = "CGR/dev-terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}

# terraform {
#   required_version = ">= 1.1.7"
#   backend "s3" {
#     bucket = "cgr-staging-terraform-bucket"
#     key    = "CGR/staging-terraform.tfstate"
#     region = "eu-central-1"
#     dynamodb_table = "terraform-locks"
#     encrypt = true
#   }
# }

# terraform {
#   required_version = ">= 1.1.7"
#   backend "s3" {
#     bucket = "cgr-staging-terraform-bucket"
#     key    = "CGR/test-terraform.tfstate"
#     region = "eu-central-1"
#     dynamodb_table = "terraform-locks"
#     encrypt = true
#   }
# }

# terraform {
#   required_version = ">= 1.1.7"
#   backend "s3" {
#     bucket = "cgr-staging-terraform-bucket"
#     key    = "CGR/non-prod-terraform.tfstate"
#     region = "eu-central-1"
#     dynamodb_table = "terraform-locks"
#     encrypt = true
#   }
# }

# terraform {
#   required_version = ">= 1.1.7"
#   backend "s3" {
#     bucket = "cgr-staging-terraform-bucket"
#     key    = "CGR/prod-terraform.tfstate"
#     region = "eu-central-1"
#     dynamodb_table = "terraform-locks"
#     encrypt = true
#   }
# }

