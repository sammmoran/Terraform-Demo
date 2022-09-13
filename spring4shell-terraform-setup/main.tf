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

resource "aws_instance" "app_server" {

  ami = "ami-090fa75af13c156b4"

  instance_type = "t2.micro"

  iam_instance_profile = "spring4shell-s3-access"

  security_groups = ["spring4shell_test"]

  key_name = "ec2_test_spring4shell"

  tags = {
    Name = var.instance_name
  }


  user_data = <<EOF

  #!/bin/bash
  
  sudo yum update -y
  sudo yum install docker -y
  sudo yum install git -y  
  sudo service docker start
  sudo usermod -a -G docker ec2-user
  sudo yum install python3
  sudo alias python = python3
  sudo git clone https://github.com/reznok/Spring4Shell-POC.git && cd Spring4Shell-POC/
	sudo docker build . -t spring4shell
	docker run -d -p 80:8080 spring4shell
  
  EOD
  EOF

}
