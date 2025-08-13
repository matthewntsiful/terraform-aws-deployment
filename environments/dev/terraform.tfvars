# Common variables
name_prefix = "BlakkBrotherInc"
environment = ["dev"] # Only include 'dev' for this environment
region      = "us-east-1"
created_by  = "Matthew Ntsiful"
managed_by  = "Terraform"

# VPC Configuration
vpc_cidr           = "10.0.0.0/16"
subnet_cidr        = ["10.0.1.0/24", "10.0.2.0/24"] # Reduced for dev
availability_zones = ["us-east-1a", "us-east-1b"]

# DNS Configuration
enable_dns_hostnames = true
enable_dns_support   = true

# NAT Gateway Configuration (can be disabled in dev to save costs)
enable_nat_gateway = false # Set to false for dev to save costs

# Security Group Configuration
allowed_cidr_blocks = ["0.0.0.0/0"] # Restrict to your IP in production
http_port           = 80
https_port          = 443
default_ssh_port    = 22
custom_ssh_port     = 69

# EC2 Configuration
instance_type = "t3.micro" # Smaller instance for dev