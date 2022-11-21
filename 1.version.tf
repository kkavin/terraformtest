# Terraform Block
terraform {
    required_version = "~> 1.3.5"
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
      }
    }
}



# Provider Block



provider "aws" {
    region = "eu-west-1"
    profile = "default"
  
}
