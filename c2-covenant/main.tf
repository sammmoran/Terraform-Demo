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



resource "aws_instance" "terraform-instance" {

  ami = "ami-090fa75af13c156b4"

  instance_type = "t2.micro"

  iam_instance_profile = aws_iam_role.terraform_iam_role.id

  security_groups = [aws_security_group.terraform_security_group.id]

  key_name = "ec2_test_spring4shell"

  tags = {
    Name = "terraform-instance"
  }

}