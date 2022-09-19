variable "ubuntu-ami" {

    type = string
    default = "ami-090fa75af13c156b4"

}

variable "windows-ami" {

    type = string
    default = "ami-0fb5befc1450ca205"

}


variable "default-instance-type" {

    type = string
    default = "t2.micro"

}


variable "key-name" {

    type = string
    default = "$AWS_SSH_KEY_NAME"

}