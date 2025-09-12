terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {
    bucket = "latest-vs-remote-state-dev"
    key    = "roboshop-dev-cicd"
    region = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}