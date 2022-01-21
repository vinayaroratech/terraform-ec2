variable "access_key" {
  description = "AWS ACCEE_KEY"
}

variable "secret_key" {
  description = "AWS SECRETE_KEY"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS profile to get access keys."
  default     = "leverture"
}


variable "cidr_block" {
  description = "CIDR for the whole VPC"

  default = {
    prod = "10.10.0.0/16"
    dev  = "10.20.0.0/16"
  }
}

variable "namespace" {
  default = "micro-mdm"
}

variable "instance_class" {
  description = "machine type to be used"

  default = {
    prod = "t2.micro"
    dev  = "t2.micro"
  }
}