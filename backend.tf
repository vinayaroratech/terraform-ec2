terraform {
  backend "s3" {
    encrypt = true
    bucket  = "micromdm-terraform-state"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    profile = "leverture"
  }
}