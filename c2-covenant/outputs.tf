
output "security_group_name" {

  description = "Name of the security group"
  value       = aws_security_group.terraform_security_group.name

}

output "security_group_id" {

  description = "ID of security groupo created"
  value       = aws_security_group.terraform_security_group.id

}

output "security_group_arn" {

  description = "ARN of the security group"
  value       = aws_security_group.terraform_security_group.arn

}

output "security_group_vpc" {

  description = "VPC ID of the security group"
  value       = aws_security_group.terraform_security_group.vpc_id

}


output "iam_role_name" {

  description = "Name of the IAM role attached to the instance"
  value       = aws_iam_role.terraform_iam_role.name

}

output "iam_role_arn" {

  description = "ARN of the IAM role attached to the instance"
  value       = aws_iam_role.terraform_iam_role.managed_policy_arns

}