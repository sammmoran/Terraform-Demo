variable "ubuntu-ami" {

  type    = string
  default = "ami-090fa75af13c156b4"

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

  type    = string
  default = "Terraform deployer should export TF_VAR_AWS_SSH_KEY_NAME to be EC2 private key on their host machine"


}