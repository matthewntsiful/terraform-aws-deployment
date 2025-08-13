variable "name_prefix" {
  type = string
}

variable "environment" {
  type = list(string)
}

variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_cidr" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_nat_gateway" {
  type = bool
}

variable "created_by" {
  type = string
}

variable "managed_by" {
  type = string
}

variable "allowed_cidr_blocks" {
  type = list(string)
}

variable "http_port" {
  type = number
}

variable "https_port" {
  type = number
}

variable "default_ssh_port" {
  type = number
}

variable "custom_ssh_port" {
  type = number
}

variable "instance_type" {
  type = map(string)
}

variable "volume_size" {
  type = map(number)
}

variable "volume_type" {
  type = string
}