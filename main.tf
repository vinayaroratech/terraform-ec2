## Network
# Create VPC
module "vpc" {
  source     = "./modules/network/vpc"
  cidr_block = var.cidr_block
  namespace  = var.namespace
  public_id  = module.ec2.public_id
  aws_region = var.aws_region
}

# Create Subnet
module "subnet" {
  source         = "./modules/network/subnet"
  vpc_id         = module.vpc.vpc_id
  vpc_cidr_block = module.vpc.vpc_cidr_block
  namespace      = var.namespace
}

# Configure Routes
module "route" {
  source              = "./modules/network/route"
  main_route_table_id = module.vpc.main_route_table_id
  gw_id               = module.vpc.gw_id

  subnets = module.subnet.subnets
}

module "sec_group" {
  source    = "./modules/network/sec_group"
  vpc_id    = module.vpc.vpc_id
  namespace = var.namespace
}

module "ssh-key" {
  source    = "./modules/ssh-key"
  namespace = var.namespace
}

module "ec2" {
  source         = "./modules/ec2"
  instance_class = var.instance_class
  key_name       = module.ssh-key.key_name
  sg_pub_id      = module.sec_group.sg_pub_id
  sg_priv_id     = module.sec_group.sg_priv_id
  subnets        = module.subnet.subnets
  namespace = var.namespace
}
