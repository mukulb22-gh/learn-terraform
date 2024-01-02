output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address for the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "security_groups_id" {
  description = "Security Groups of Ec2 Instance"
  value       = aws_instance.app_server.vpc_security_group_ids
}