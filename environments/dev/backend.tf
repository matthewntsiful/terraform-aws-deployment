# terraform-aws-deployment/environments/dev/backend.tf
terraform {
  backend "s3" {
    bucket       = "terraform-projects-backend--6dptpbxe"
    key          = "environments/dev/terraform.tfstate"
    region       = "af-south-1"
    encrypt      = true
    use_lockfile = true
  }
}