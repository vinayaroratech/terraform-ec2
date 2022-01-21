output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "gw_id" {
  value = module.vpc.gw_id
}

output "main_route_table_id" {
  value = module.vpc.main_route_table_id
}

output "vpc_dhcp_id" {
  value = module.vpc.vpc_dhcp_id
}

output "subnets" {
  value = module.subnet.subnets
}

output "route_id" {
  value = module.route.route_id
}

output "sec_group_pub_id" {
  value = module.sec_group.sg_pub_id
}

output "sec_group_priv_id" {
  value = module.sec_group.sg_priv_id
}

output "public_connection_string" {
  description = "Copy/Paste/Enter - You are in the matrix"
  value       = "ssh -i ${module.ssh-key.key_name}.pem ubuntu@${module.ec2.public_ip}"
}

output "private_connection_string" {
  description = "Copy/Paste/Enter - You are in the private ec2 instance"
  value       = "ssh -i ${module.ssh-key.key_name}.pem ubuntu@${module.ec2.private_ip}"
}