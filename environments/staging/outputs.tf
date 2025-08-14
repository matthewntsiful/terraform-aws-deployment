# VPC Outputs
# ------------
# The ID of the VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# List of public subnet IDs
output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

# List of private subnet IDs
output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

# List of availability zones in use
output "availability_zones" {
  description = "List of availability zones in use"
  value       = module.vpc.availability_zones
}

# NAT Gateway Outputs (if enabled)
# --------------------------------
# List of NAT Gateway IDs
output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  value       = module.vpc.nat_gateway_ids
}

# EC2 Instance Outputs
# ---------------------
# Map of instance IDs to their AZs
output "instance_ids" {
  description = "Map of instance IDs to their AZs"
  value       = module.ec2.instance_ids
}

# List of all EC2 instance IDs
output "instance_id_list" {
  description = "List of all EC2 instance IDs"
  value       = module.ec2.instance_id_list
}

# Map of private IPs by AZ
output "private_ips" {
  description = "Map of private IPs by AZ"
  value       = module.ec2.private_ips
}

# Map of private DNS names by AZ
output "private_dns_map" {
  description = "Map of private DNS names by AZ"
  value       = module.ec2.private_dns_map
}

# Map of instance states by AZ
output "instance_states" {
  description = "Map of instance states by AZ"
  value       = module.ec2.instance_states
}

# The name of the SSH key pair
output "key_name" {
  description = "The name of the SSH key pair"
  value       = module.ec2.key_name
}

# Path to the generated private key file
output "private_key_path" {
  description = "Path to the generated private key file"
  value       = module.ec2.private_key_path
}

# Map of security group IDs by AZ
output "security_groups" {
  description = "Map of security group IDs by AZ"
  value       = module.ec2.security_groups
}

# Map of subnet IDs by AZ
output "subnet_ids" {
  description = "Map of subnet IDs by AZ"
  value       = module.ec2.subnet_ids
}

# Map of SSH connection commands by AZ
output "ssh_connection_commands" {
  description = "Map of SSH connection commands by AZ"
  value       = module.ec2.ssh_connection_commands
  sensitive   = true
}

# ALB Outputs
# ------------
# The DNS name of the load balancer
output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.load-balancer.alb_dns_name
}

# The ARN of the ALB target group
output "alb_target_group_arn" {
  description = "The ARN of the ALB target group"
  value       = module.load-balancer.alb_target_group_arn
}

# The ID of the ALB security group
output "alb_sg_id" {
  description = "The ID of the ALB security group"
  value       = module.load-balancer.alb_sg_id
}


# Database Outputs
# ----------------
# The connection endpoint for the RDS instance
output "db_instance_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = module.database.db_instance_endpoint
}

# The address of the RDS instance
output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.database.db_instance_address
  sensitive   = true
}

# The database port
output "db_instance_port" {
  description = "The database port"
  value       = module.database.db_instance_port
}

# The username for the RDS instance
output "db_username" {
  description = "The master username for the database"
  value       = module.database.db_username
  sensitive   = true
}

# The password for the RDS instance
output "db_password" {
  description = "The password for the RDS instance"
  value       = module.database.db_password
  sensitive   = true
}

# The name of the RDS instance
output "db_instance_name" {
  description = "The database name"
  value       = module.database.db_instance_name
}

# The ID of the RDS instance
output "db_instance_id" {
  description = "The ID of the RDS instance"
  value       = module.database.db_instance_id
}

# The ARN of the RDS instance
output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.database.db_instance_arn
}

# The security group ID of the RDS instance
output "db_security_group_id" {
  description = "The security group ID of the RDS instance"
  value       = module.database.db_security_group_id
}

# Parameter group
output "db_parameter_group_name" {
  description = "The name of the parameter group associated with the RDS instance"
  value       = module.database.db_parameter_group_name
}

# Backup and maintenance
output "db_backup_retention_period" {
  description = "The backup retention period in days"
  value       = module.database.db_backup_retention_period
}