variable "name_prefix" {
  description = "Prefix for all resource names"
  type        = string
}

variable "environment" {
  description = "List of environments (typically contains 'dev', 'staging', 'prod')"
  type        = list(string)
}

variable "region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "List of CIDR blocks for subnets (2 public, 2 private)"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones to use for subnets"
  type        = list(string)
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnets"
  type        = bool
}

variable "created_by" {
  description = "Name of the resource creator"
  type        = string
}

variable "managed_by" {
  description = "Entity responsible for managing the resources"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "List of allowed CIDR blocks for security group rules"
  type        = list(string)
}

variable "http_port" {
  description = "Port for HTTP traffic"
  type        = number
}

variable "https_port" {
  description = "Port for HTTPS traffic"
  type        = number
}

variable "default_ssh_port" {
  description = "Default port for SSH access"
  type        = number
}

variable "custom_ssh_port" {
  description = "Custom port for SSH access"
  type        = number
}

variable "instance_type" {
  description = "Map of instance types for different environments"
  type        = map(string)
}

variable "volume_size" {
  description = "Map of root volume sizes (in GB) for different environments"
  type        = map(number)
}

variable "volume_type" {
  description = "Type of EBS volume (e.g., gp2, gp3, io1)"
  type        = string
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