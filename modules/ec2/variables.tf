variable "ami" {
  default = "ami-0e472ba40eb589f49"
}
variable "instance_class" {
}

variable "key_name" {
}

variable "sg_pub_id" {
}

variable "sg_priv_id" {
}

variable "subnets" {
  type = list(string)
}

variable "aws_account_number" {
  default = "807458674700"
}
variable "namespace" {}