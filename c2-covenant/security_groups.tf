
resource "aws_security_group" "terraform_security_group" {

  name = "terraform-security-group"

  description = "This security group is a test of Terraform"

  # Ingress HTTP
  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["100.16.247.63/32"]


  }

  # Ingress HTTPS
  ingress {

    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["100.16.247.63/32"]

  }

  # Ingress SSH
  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["100.16.247.63/32"]

  }


  # Egress all traffic outgoing
  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}