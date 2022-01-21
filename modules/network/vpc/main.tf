# Create a VPC to launch build instances into
resource "aws_vpc" "vpc_id" {
  cidr_block           = var.cidr_block[terraform.workspace]
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    name = "${var.namespace}-${terraform.workspace}-vpc"
  }
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "gw_id" {
  vpc_id = aws_vpc.vpc_id.id

  tags = {
    Name = terraform.workspace
  }
}

# Create dhcp option setup
resource "aws_vpc_dhcp_options" "vpc_dhcp_id" {
  domain_name         = "${var.aws_region}.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    Name = terraform.workspace
  }
}

resource "aws_eip" "ip-test-env" {
  instance = var.public_id
  vpc      = true
}