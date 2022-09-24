resource "aws_instance" "redirector_instance" {

  ami = var.ubuntu-ami

  instance_type = var.default-instance-type

  iam_instance_profile = aws_iam_instance_profile.redirector_iam_role_profile.id

  vpc_security_group_ids = [aws_security_group.common_security_group.id]

  key_name = var.AWS_SSH_KEY_NAME

  tags = {
    Name = "redirector-instance"
  }

}