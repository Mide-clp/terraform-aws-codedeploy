terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.50.0"
    }
  }
}

provider "aws" {
  
}

module "subnet" {
  source = "../modules/subnet"
  subnet_count  = var.subnet_count
}