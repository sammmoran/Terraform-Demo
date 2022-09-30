variable "ubuntu-ami" {

  type    = string
  default = "ami-08c40ec9ead489470"

}

variable "windows-ami" {

  type    = string
  default = "ami-0fb5befc1450ca205"

}


variable "default-instance-type" {

  type    = string
  default = "t2.micro"

}


variable "AWS_SSH_KEY_NAME" {

  type      = string
  default   = ""
  sensitive = true

}

variable "IP_ADDRESS" {

  type      = string
  default   = ""
  sensitive = true

}