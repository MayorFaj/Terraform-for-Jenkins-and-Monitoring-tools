
variable "tags" {
  description = "Tags assigned to variables"
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  type        = string
  description = "Region to deploy resource"
}

# variable "AZ" {
#   type        = string
#   description = "Availability zone to deploy resources"
# }

variable "key_pair" {
  type        = string
  description = "Key pair name"
}

variable "vpc_cidr" {
  type        = string
  description = "cidr block of the vpc"
}

variable "pub-subnet-cidr" {
  type        = string
  description = "cidr block of subnet"
}

variable "instance" {

}