module "vpc" {
  source               = "git::https://github.com/matthewntsiful/terraform-aws-modules.git//modules/vpc?ref=main"
  name_prefix          = "BlakkBrotherInc"
  environment          = ["staging"]
  region               = "us-east-1"
  vpc_cidr             = "10.1.0.0/16"
  subnet_cidr          = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway   = true
  created_by           = "Matthew Ntsiful"
  managed_by           = "Terraform"
}

module "security-group" {
  source = "git::https://github.com/matthewntsiful/terraform-aws-modules.git//modules/security-group?ref=main"

  name_prefix                = "BlakkBrotherInc"
  environment                = ["staging"]
  region                     = "us-east-1"
  vpc_id                     = module.vpc.vpc_id
  security_group_name_suffix = "web-sg"
  allowed_cidr_blocks        = ["0.0.0.0/0"] # Consider restricting this further for staging
  created_by                 = "Matthew Ntsiful"
  managed_by                 = "Terraform"

  # Customize ports as needed
  http_port        = 80
  https_port       = 443
  default_ssh_port = 22
  custom_ssh_port  = 69

  depends_on = [module.vpc]
}

module "ec2" {
  source = "git::https://github.com/matthewntsiful/terraform-aws-modules.git//modules/ec2?ref=main"

  name_prefix       = "BlakkBrotherInc"
  environment       = ["staging"]
  region            = "us-east-1"
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = module.security-group.security_group_id
  created_by        = "Matthew Ntsiful"
  managed_by        = "Terraform"

  # Instance type mapping by environment
  instance_type = {
    staging = "t3.small"
  }

  # Custom SSH port (matching security group)
  custom_ssh_port = 69

  # Associate public IP
  associate_public_ip = true

  depends_on = [
    module.vpc,
    module.security-group
  ]
}