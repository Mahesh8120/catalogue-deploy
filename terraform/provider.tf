terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.38.0"
    }
  }

  backend "s3" {
    bucket         = "pjdevops-state-dev"
    key            = "catalogue"
    region         = "us-east-1"
    dynamodb_table = "pjdevops-locking-dev"
  }

}
provider "aws" {
  region = "us-east-1"
} 