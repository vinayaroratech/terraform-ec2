# data "aws_ami" "ubuntu" {

#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
#   }

#   owners = [var.aws_account_number]
# }



resource "aws_instance" "ec2_public" {
  ami                         = var.ami // data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = var.instance_class[terraform.workspace]
  key_name                    = var.key_name
  subnet_id                   = var.subnets[0]
  vpc_security_group_ids      = [var.sg_pub_id]

  tags = {
    "Name" = "${dev.namespace}-public-${terraform.workspace}"
  }

  # Copies the ssh key file to home dir
  provisioner "file" {
    source      = "./${var.key_name}.pem"
    destination = "/home/ubuntu/${var.key_name}.pem"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${var.key_name}.pem")
      host        = self.public_ip
      timeout     = "2m"
      agent       = false
    }
  }

  //chmod key 400 on EC2 instance
  provisioner "remote-exec" {
    inline = ["chmod 400 ~/${var.key_name}.pem"]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${var.key_name}.pem")
      host        = self.public_ip
    }

  }

}

// Configure the EC2 instance in a private subnet
resource "aws_instance" "ec2_private" {
  ami                         = var.ami // data.aws_ami.ubuntu.id
  associate_public_ip_address = false
  instance_type               = var.instance_class[terraform.workspace]
  key_name                    = var.key_name
  subnet_id                   = var.subnets[1]
  vpc_security_group_ids      = [var.sg_priv_id]

  tags = {
    "Name" = "${dev.namespace}-private-${terraform.workspace}"
  }

}