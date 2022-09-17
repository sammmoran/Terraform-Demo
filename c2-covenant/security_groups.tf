resource "aws_security_group" "terraform-security-group" {

  name = "terraform-security-group"

  description = "This security group is a test of Terraform"

  # Ingress HTTP
  ingress {

    from_port = 80
    to_port   = 80
    protocol  = "tcp"

  }

  # Ingress HTTPS
  ingress {

    from_port = 443
    to_port   = 443
    protocol  = "tcp"

  }

  # Ingress SSH
  ingress {

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

  }


  # Egress all traffic outgoing
  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}