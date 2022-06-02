terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  # cloud {
  #   organization = "pj4terraform"

  #   workspaces {
  #     name = "frontend"
  #   }
  # }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-2"
}