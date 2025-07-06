provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "main" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
        Name = "main-vpc-1"
    }
}
terraform {
  backend "s3" {
    bucket = "tfstate-bucket-1x"
    key    = "infraupdate-1/terraform.tfstate"
    region = "us-east-1"
  }
}
