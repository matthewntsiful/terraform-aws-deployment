# Common variables
name_prefix = "BlakkBrotherInc"
environment = "prod"
region      = "us-east-1"
created_by  = "Matthew Ntsiful"
managed_by  = "Terraform"

# VPC Configuration
vpc_cidr           = "10.2.0.0/16"
subnet_cidr        = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24", "10.2.4.0/24"]
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

# DNS Configuration
enable_dns_hostnames = true
enable_dns_support   = true

# NAT Gateway Configuration
enable_nat_gateway = true # Highly available NAT for production

# Security Group Configuration
# IMPORTANT: Replace with your actual IP addresses in production
allowed_cidr_blocks = ["0.0.0.0/0"] # WARNING: Restrict to specific IPs in production
http_port           = 80
https_port          = 443
default_ssh_port    = 22
custom_ssh_port     = 22000 # Using non-standard SSH port in production

# EC2 Configuration
instance_type = {
  prod = "t3.medium" # Larger instance for production
}

# # Production-specific settings
# enable_cloudwatch_logging = true
# enable_cloudwatch_alarms  = true
# backup_retention_days     = 30