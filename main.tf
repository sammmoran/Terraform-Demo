terraform {

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }

  }

  required_version = ">= 1.2.0"

}

provider "aws" {

  region = "us-east-1"

}


resource "aws_instance" "spring4shell" {


  ami                  = "ami-090fa75af13c156b4"
  count   = 3
  instance_type        = "t2.micro"

  tags = {
    Name = "spring4shell-terraform"
  }

}