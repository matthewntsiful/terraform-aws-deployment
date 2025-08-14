variable "name_prefix" {
  type        = string
  description = "Prefix for all resource names"
}

variable "environment" {
  type        = list(string)
  description = "Environment name (e.g., prod)"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
}

variable "subnet_cidr" {
  type        = list(string)
  description = "List of subnet CIDR blocks"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in the VPC"
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support in the VPC"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Enable NAT Gateway for private subnets"
}

variable "created_by" {
  type        = string
  description = "Tag identifying who created the resource"
}

variable "managed_by" {
  type        = string
  description = "Tag identifying how the resource is managed"
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  description = "List of allowed CIDR blocks for security group rules"
}

variable "http_port" {
  type        = number
  description = "HTTP port"
}

variable "https_port" {
  type        = number
  description = "HTTPS port"
}

variable "default_ssh_port" {
  type        = number
  description = "Default SSH port"
}

variable "custom_ssh_port" {
  type        = number
  description = "Custom SSH port for the security group"
}

variable "instance_type" {
  type        = map(string)
  description = "Map of environment to EC2 instance type"
}
variable "volume_size" {
  type        = map(number)
  description = "Map of environment to EC2 volume size"
}
variable "volume_type" {
  type        = string
  description = "EC2 volume type"
}

# Production-specific variables
# variable "enable_cloudwatch_logging" {
#   type        = bool
#   description = "Enable CloudWatch logging for production instances"
# }

# variable "enable_cloudwatch_alarms" {
#   type        = bool
#   description = "Enable CloudWatch alarms for production"
# }

# variable "backup_retention_days" {
#   type        = number
#   description = "Number of days to retain backups in production"
# }