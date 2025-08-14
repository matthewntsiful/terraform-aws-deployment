# Common variables
name_prefix = "BlakkBrotherInc"
environment = ["staging"]
region      = "us-east-1"
created_by  = "Matthew Ntsiful"
managed_by  = "Terraform"

# VPC Configuration
vpc_cidr           = "10.1.0.0/16"
subnet_cidr        = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]

# DNS Configuration
enable_dns_hostnames = true
enable_dns_support   = true

# NAT Gateway Configuration
enable_nat_gateway = true # Enabled for staging

# Security Group Configuration
allowed_cidr_blocks = ["0.0.0.0/0"] # Consider restricting this for staging
http_port           = 80
https_port          = 443
default_ssh_port    = 22
custom_ssh_port     = 69

# EC2 Configuration
instance_type = { staging = "t3.small" } # Medium-sized instance for staging
volume_size   = { staging = 35 }
volume_type   = "gp2"

