terraform {
  backend "s3" {
    bucket         = "deployments-dev-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "deployments-dev-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}
