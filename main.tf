provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "main" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
        Name = "main-vpc-1x"
    }
}
terraform {
  backend "s3" {
    bucket = "tfstate-bucket-1x"
    key    = "infraupdate-1/terraform.tfstate"
    region = "us-east-1"
  }
}

# Public Subnet 1
resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true
}

# Public Subnet 2
resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1e"
  map_public_ip_on_launch = true
}

