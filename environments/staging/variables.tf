variable "name_prefix" {
  type        = string
  description = "Prefix for all resource names"
}

variable "environment" {
  type        = list(string)
  description = "List of environment names"
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

variable "db_username" {
  description = "Username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
}
variable "db_instance_engine" {
  description = "Engine for the RDS instance"
  type        = string
}

variable "db_instance_engine_version" {
  description = "Engine version for the RDS instance"
  type        = string
}

variable "db_instance_class" {
  description = "Instance class for the RDS instance"
  type        = map(string)
}

variable "db_instance_multi_az" {
  description = "Enable Multi-AZ deployment for the RDS instance"
  type        = bool
}

variable "db_instance_allowed_cidr_blocks" {
  description = "List of allowed CIDR blocks for security group rules"
  type        = list(string)
}

variable "db_instance_storage_size" {
  description = "Storage size for the RDS instance"
  type        = map(number)
}

variable "db_instance_parameter_group_name" {
  description = "Parameter group name for the RDS instance"
  type        = string
}

variable "db_instance_skip_final_snapshot" {
  description = "Skip final snapshot for the RDS instance"
  type        = bool
}