terraform {
    backend "s3"{
        bucket = "mg-terraform-state-storage"
        key = "project-networking/terraform.tfstate"
        region = "aws_region_placeholder"
        access_key = "access_key_placeholder"
        secret_key = "secret_key_placeholder"
        encrypt = true
    }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}