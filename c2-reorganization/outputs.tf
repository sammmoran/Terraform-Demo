output "shared_target-redirector_output" {

  description = "Display security group shared by redirector and target"
  value = [
    aws_security_group.shared_target-redirector_security_group.id, aws_security_group.shared_target-redirector_security_group.arn, aws_security_group.shared_target-redirector_security_group.owner_id
  ]

}

output "c2_security_group_output" {

  description = "Display security group for C2-server"
  value = [
    aws_security_group.c2_security_group.id,
    aws_security_group.c2_security_group.arn, aws_security_group.c2_security_group.owner_id
  ]

}