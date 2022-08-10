terraform {

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }

  }

  required_version = ">= 1.2.0"

}




# Specifying AWS as our Cloud resource of choice
provider "aws" {

  region = "us-east-1"

}



# Make a copy of the SSH key and place it on the EC2 Instance
resource "aws_key_pair" "ssh_key" {

  key_name = "ssh-4-spring4shell"

  public_key = file("../../../Downloads/ec2_test_spring4shell.pem")

}



# Empty VPC resource (default settings will be used here)
resource "aws_default_vpc" "default" {}



# Security groups to create firewall rules for SSH
resource "aws_security_group" "spring4shell-security-group-tf" {

  name = "spring4shell-security-group-tf"

  description = "This security group is to replicate the spring4shell vulnerability via Docker container over Terraform infrastructure"

  vpc_id = aws_default_vpc.default.id

  ingress {

    from_port   = 0
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}

resource "aws_instance" "spring4shell" {


  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"

  vpc_security_group_ids      = aws_security_group.spring4shell-security-group-tf.id
  key_name                    = aws.ssh_key.id
  associate_public_ip_address = "true"

  root_block_device {

    volume_size = "25"

  }


  output "public_ip " {

    value = aws_instance.basic_ec2.public_ip

  }

  user_data = <<EOF

  #!/bin/bash
  sudo yum update -y
  sudo yum install docker -y
  sudo yum install git
  sudo service docker start
  sudo usermod -a -G docker ec2-user
  sudo yum install python3
  alias python=python3
  git clone https://github.com/reznok/Spring4Shell-POC.git
  docker build . -t spring4shell
  docker run -d -p 80:8080 spring4shell

  EOF


  tags = {
    Name = "spring4shell-terraform"
  }

}