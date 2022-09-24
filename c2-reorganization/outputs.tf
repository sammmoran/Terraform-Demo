# Output for target and redirector security group
output "common_output" {

  description = "Display security group shared by redirector and target"
  value = [
    aws_security_group.common_security_group.id, aws_security_group.common_security_group.arn, aws_security_group.common_security_group.owner_id
  ]

}

# Output for C2 security group
output "c2_security_group_output" {

  description = "Display security group for C2-server"
  value = [
    aws_security_group.c2_security_group.id,
    aws_security_group.c2_security_group.arn, aws_security_group.c2_security_group.owner_id
  ]

}


# Outputs for IAM Policies
output "iam_policy_outputs" {

  description = "Output IAM policies"

  value = [
    aws_iam_policy.target_iam_policy.id,
    aws_iam_policy.redirector_iam_policy.id,
    aws_iam_policy.c2_iam_policy.id
  ]
}


# Outputs for IAM Roles
output "iam_role_outputs" {

  description = "Output IAM roles"

  value = [
    aws_iam_role.target_iam_role.id,
    aws_iam_role.redirector_iam_role.id,
    aws_iam_role.c2_iam_role.id
  ]

}


# Outputs for IAM role profiles
output "iam_role_profiles" {

  description = "Output IAM role profiles"

  value = [
    aws_iam_instance_profile.target_iam_role_profile.id,
    aws_iam_instance_profile.redirector_iam_role_profile.id,
    aws_iam_instance_profile.c2_iam_role_profile.id
  ]

}


# Outputs for created EC2 Instances
output "instances" {

  description = "Output for created instances"
  value = [
    aws_instance.target_instance.id,
    aws_instance.redirector_instance.id,
    aws_instance.c2_instance.id
  ]

} 