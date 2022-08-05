
# AWS IAM Policy for Terraform-deployed Spring4Shell EC2 instances

resource "aws_iam_policy" "ec2_policy" {

  name        = "spring4shell-terraform-policy"
  path        = "/"
  description = "This policy will enable terraform-deployed Spring4Shell applications to access S3 buckets"

  policy = jsonencode(

    # Allow policy for EC2 Instance interaction with S3 bucket

    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "s3:*",
            "s3-object-lambda:*"
          ],
          "Resource" : "*"
        }
      ]
    }


  )

}


# AWS IAM Role for Terraform-deployed Spring4Shell EC2 instances

resource "aws_iam_role" "ec2_role" {

  name = "spring4shell-terraform-role"

  assume_role_policy = jsonencode(

    {

      Version = "2012-10-17"
      Statement = [

        {

          Action    = "sts:AssumeRole"
          Effect    = "Allow"
          Sid       = ""
          Principal = { Service = "ec2.amazonaws.com" }

        }

      ]

    }

  )

}

# Now, attach that role to the policy file
resource "aws_iam_policy_attachment" "ec2_policy_role" {

  name       = "spring4shell_policy_role"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.ec2_policy.arn

}



# Then, allow the IAM role attachment to an EC2 instance
# This conceptually contains an instance profile that acts like a vessel that contains only one IAM role that an EC2 instance can assume_role_policy
# The instance profile will be attached to the aws_instance in main.terraform
resource "aws_iam_instance_profile" "ec2_profile" {

  name = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}