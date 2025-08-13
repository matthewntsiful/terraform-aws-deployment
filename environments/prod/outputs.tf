# VPC Outputs
output "vpc_id" {
  description = "The ID of the production VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the production VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the production VPC"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "List of public subnet IDs in production"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs in production"
  value       = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway in production"
  value       = module.vpc.internet_gateway_id
}

# Security Group Outputs
output "security_group_id" {
  description = "The ID of the security group in production"
  value       = module.security-group.security_group_id
}

output "security_group_arn" {
  description = "The ARN of the security group in production"
  value       = module.security-group.security_group_arn
}

output "security_group_name" {
  description = "The name of the security group in production"
  value       = module.security-group.security_group_name
}

output "security_group_vpc_id" {
  description = "The VPC ID the security group belongs to in production"
  value       = module.security-group.vpc_id
}

# EC2 Instance Outputs
output "instance_id" {
  description = "The ID of the EC2 instance in production"
  value       = module.ec2.instance_id
}

output "instance_arn" {
  description = "The ARN of the EC2 instance in production"
  value       = module.ec2.instance_arn
}

# Note: In a production environment, you might want to be more careful with exposing IPs
output "public_ip" {
  description = "The public IP address of the EC2 instance in production"
  value       = module.ec2.public_ip
  sensitive   = true # Marking as sensitive in production
}

output "private_ip" {
  description = "The private IP address of the EC2 instance in production"
  value       = module.ec2.private_ip
  sensitive   = true # Marking as sensitive in production
}

output "public_dns" {
  description = "The public DNS name of the EC2 instance in production"
  value       = module.ec2.public_dns
}

output "private_dns" {
  description = "The private DNS name of the EC2 instance in production"
  value       = module.ec2.private_dns
}

output "instance_state" {
  description = "The current state of the EC2 instance in production"
  value       = module.ec2.instance_state
}

output "ssh_connection_command" {
  description = "SSH connection command to the EC2 instance in production"
  value       = module.ec2.ssh_connection_command
  sensitive   = true
}

# Key Pair Outputs
output "key_name" {
  description = "The name of the SSH key pair in production"
  value       = module.ec2.key_name
}

output "private_key_pem" {
  description = "The private key data in PEM format in production"
  value       = module.ec2.private_key_pem
  sensitive   = true
}

output "private_key_path" {
  description = "Path to the generated private key file in production"
  value       = module.ec2.private_key_path
  sensitive   = true
}

output "instance_security_groups" {
  description = "List of security group IDs associated with the instance in production"
  value       = module.ec2.security_groups
}

output "instance_type" {
  description = "The type of the instance in production"
  value       = module.ec2.instance_type
}

output "subnet_id" {
  description = "The ID of the subnet the instance is in, in production"
  value       = module.ec2.subnet_id
}

output "availability_zone" {
  description = "The availability zone of the instance in production"
  value       = module.ec2.availability_zone
}

# Region and Availability Zones
output "region" {
  description = "AWS region for production"
  value       = var.region
}

output "availability_zones" {
  description = "List of availability zones in use in production"
  value       = module.vpc.availability_zones
}

# NAT Gateway Outputs (if enabled)
output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs in production"
  value       = module.vpc.nat_gateway_ids
}

output "nat_gateway_public_ips" {
  description = "List of public IPs for NAT Gateways in production"
  value       = module.vpc.nat_gateway_public_ips
}

# Production-specific outputs
# Uncomment and implement these outputs after setting up CloudWatch and SNS resources
# output "cloudwatch_log_group_arn" {
#   description = "The ARN of the CloudWatch log group for production"
#   value       = var.enable_cloudwatch_logging ? aws_cloudwatch_log_group.prod_logs[0].arn : "CloudWatch logging disabled"
# }
# 
# output "alarm_sns_topic_arn" {
#   description = "The ARN of the SNS topic for production alarms"
#   value       = var.enable_cloudwatch_alarms ? aws_sns_topic.prod_alarms[0].arn : "CloudWatch alarms disabled"
# }

# output "backup_retention_days" {
#   description = "Number of days to retain backups in production"
#   value       = var.backup_retention_days
# }