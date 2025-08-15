terraform {
  backend "s3" {
    bucket         = "deployments-prod-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "deployments-prod-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}
