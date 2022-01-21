output "public_ip" {
  value = aws_instance.ec2_public.public_ip
}

output "public_id" {
  value = aws_instance.ec2_public.id
}

output "ec2-public-dns" {
  value = aws_instance.ec2_public.public_dns
}

output "private_ip" {
  value = aws_instance.ec2_private.private_ip
}

output "ec2-public-private-dns" {
  value = aws_instance.ec2_private.private_dns
}