# Security group for both Target and Redirector server
resource "aws_security_group" "common_security_group" {

  name = "common-security-group"

  description = "This security group is for the target and redirector EC2 Instances"

  # Ingress SSH
  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  # Ingress HTTP
  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  # Egress everywhere
  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}



# Security group for C2-server
resource "aws_security_group" "c2_security_group" {

  name = "c2-security-group"

  description = "This security group is for the target and redirector EC2 Instances"

  # Ingress SSH
  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.IP_ADDRESS]

  }

  # Ingress HTTPS
  ingress {

    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.IP_ADDRESS]

  }

  # Ingress for RDP 
  ingress {

    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [var.IP_ADDRESS]

  }

  # Egress everywhere
  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.IP_ADDRESS]

  }


}