terraform {
  backend "s3" {
    bucket         = "deployments-staging-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "deployments-staging-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}
