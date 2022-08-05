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
  instance_type        = "t2.micro"
  security_groups      = ["aws_security_group.terraform_sg.name"]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name


  provisioner "remote-exec" {

    inline = [
      "sudo yum update -y",
      "sudo yum install docker -y",
      "sudo yum install git",
      "sudo service docker start",
      "sudo yum install python3",
      "alias python=python3",
      "git clone https://github.com/reznok/Spring4Shell-POC.git",
      "docker build . -t spring4shell",
      "docker run -d -p 80:8080 spring4shell",
    ]

  }

  tags = {

    Name = "spring4shell-terraform"
  }

}