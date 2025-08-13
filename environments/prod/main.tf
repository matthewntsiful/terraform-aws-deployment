module "vpc" {
  #source               = "git::https://github.com/matthewntsiful/terraform-aws-modules.git//modules/vpc?ref=main"
  source = "git@github.com:matthewntsiful/terraform-aws-modules.git//modules/vpc?ref=v0.1.0"


  name_prefix          = "BlakkBrotherInc"
  environment          = ["prod"]
  region               = "us-east-1"
  vpc_cidr             = "10.2.0.0/16"
  subnet_cidr          = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24", "10.2.4.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway   = true
  created_by           = "Matthew Ntsiful"
  managed_by           = "Terraform"
}

module "security-group" {
  #source = "git::https://github.com/matthewntsiful/terraform-aws-modules.git//modules/security-group?ref=main"
  source = "git@github.com:matthewntsiful/terraform-aws-modules.git//modules/security-group?ref=v0.1.0"

  name_prefix                = "BlakkBrotherInc"
  environment                = ["prod"]
  region                     = "us-east-1"
  vpc_id                     = module.vpc.vpc_id
  security_group_name_suffix = "web-sg"
  allowed_cidr_blocks        = ["0.0.0.0/0"] # TODO: Restrict this to specific IPs in production
  created_by                 = "Matthew Ntsiful"
  managed_by                 = "Terraform"

  # Customize ports as needed
  http_port        = 80
  https_port       = 443
  default_ssh_port = 22
  custom_ssh_port  = 69 # Consider changing this for production

  depends_on = [module.vpc]
}

module "ec2" {
  #source = "git::https://github.com/matthewntsiful/terraform-aws-modules.git//modules/ec2?ref=main"
  source = "git@github.com:matthewntsiful/terraform-aws-modules.git//modules/ec2?ref=v0.1.0"

  name_prefix       = "BlakkBrotherInc"
  environment       = ["prod"]
  region            = "us-east-1"
  subnet_id         = module.vpc.public_subnet_ids[0] # Consider using private subnets in production
  security_group_id = module.security-group.security_group_id
  created_by        = "Matthew Ntsiful"
  managed_by        = "Terraform"

  # Production-specific instance type as a map
  instance_type = {
    prod = "t3.medium"
  }

  # Custom SSH port (matching security group)
  custom_ssh_port = 69 # Consider changing this for production

  # Consider setting this to false and using a bastion host in production
  associate_public_ip = true

  depends_on = [
    module.vpc,
    module.security-group
  ]
}