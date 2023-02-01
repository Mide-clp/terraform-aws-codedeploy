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

locals {
  ingress = [
    {
        description = "HTTP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false
    },
    {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks =[format("%s/32", data.http.ip.response_body)]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false
    }
  ]
}

resource "aws_vpc" "web_app_vpc" {
  cidr_block = var.cidr_block
  tags  = {
        "terraform": "true",
        "purpose": "web_app"
    }
}

module "subnet" {
  source = "../modules/subnet"
  subnet_vpc_id = aws_vpc.web_app_vpc.id
  subnet_count  = var.subnet_count
  subnet_cidr_blocks = var.subnet_cidr_blocks
  subnet_availability_zones = var.subnet_availability_zones
}

module "security_group" {
  source = "../modules/security_group"
  sg_name = var.sg_name
  sg_vpc_id = aws_vpc.web_app_vpc.id
  ingress_rule = local.ingress
  egress_rule = var.egress_rule
}