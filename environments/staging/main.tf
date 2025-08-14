module "vpc" {
  #source               = "git::https://github.com/matthewntsiful/terraform-aws-modules.git//modules/vpc?ref=main"
  source = "git@github.com:matthewntsiful/terraform-aws-modules.git//modules/vpc?ref=v0.1.15"

  name_prefix          = var.name_prefix
  environment          = [var.environment[0]]  # Pass as list with first element
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  subnet_cidr          = var.subnet_cidr
  availability_zones   = var.availability_zones
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  enable_nat_gateway   = var.enable_nat_gateway
  created_by           = var.created_by
  managed_by           = var.managed_by
}

module "security-group" {
  #source = "git::https://github.com/matthewntsiful/terraform-aws-modules.git//modules/security-group?ref=main"
  source = "git@github.com:matthewntsiful/terraform-aws-modules.git//modules/security-group?ref=v0.1.15"

  name_prefix         = var.name_prefix
  environment         = var.environment
  region              = var.region
  vpc_id              = module.vpc.vpc_id
  alb_sg_id           = module.load-balancer.alb_sg_id
  allowed_cidr_blocks = var.allowed_cidr_blocks
  created_by          = var.created_by
  managed_by          = var.managed_by


  depends_on = [module.vpc, module.load-balancer]
}

module "load-balancer" {
  #source = "git::https://github.com/matthewntsiful/terraform-aws-modules.git//modules/load-balancer?ref=main"
  source = "git@github.com:matthewntsiful/terraform-aws-modules.git//modules/load-balancer?ref=v0.1.15"

  name_prefix       = var.name_prefix
  environment       = var.environment
  region            = var.region
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  created_by        = var.created_by
  managed_by        = var.managed_by

  depends_on = [module.vpc]
}

module "ec2" {
  #source = "git::https://github.com/matthewntsiful/terraform-aws-modules.git//modules/ec2?ref=main"
  source = "git@github.com:matthewntsiful/terraform-aws-modules.git//modules/ec2?ref=v0.1.15"

  name_prefix = var.name_prefix
  environment = var.environment
  region      = var.region
  subnet_ids = [
    module.vpc.private_subnet_ids[0],
    module.vpc.private_subnet_ids[1]
  ]
  security_group_id    = module.security-group.security_group_id
  alb_target_group_arn = module.load-balancer.alb_target_group_arn
  target_group_port    = module.load-balancer.target_group_port
  instance_type        = var.instance_type
  created_by           = var.created_by
  managed_by           = var.managed_by

  depends_on = [
    module.vpc,
    module.security-group,
    module.load-balancer
  ]
}