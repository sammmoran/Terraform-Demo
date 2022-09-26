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


resource "aws_instance" "c2_instance" {

  ami = var.ubuntu-ami

  instance_type = var.default-instance-type

  iam_instance_profile = aws_iam_instance_profile.c2_iam_role_profile.id

  vpc_security_group_ids = [aws_security_group.c2_security_group.id, aws_security_group.vnc_security_group.id]

  key_name = var.AWS_SSH_KEY_NAME

  tags = {
    Name = "c2-instance"
  }

  user_data = file("c2-server.sh")
}