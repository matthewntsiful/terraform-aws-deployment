# terraform-aws-deployment/environments/prod/backend.tf
terraform {
  backend "s3" {
    bucket       = "terraform-projects-backend--6dptpbxe"
    key          = "environments/prod/terraform.tfstate"
    region       = "af-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
