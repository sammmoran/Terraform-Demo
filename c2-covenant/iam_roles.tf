
resource "aws_iam_policy" "terraform-policy" {

  name = "terraform-policy"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Action   = ["s3:Get*", "s3:List*", "s3-object-lambda:Get*", "s3-object-lambda:List*"]
        Effect   = "Allow"
        Resource = "*"

      }

    ]


  })

}


data "aws_iam_policy_document" "instance-assume-role-policy" {

  statement {

    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]

    }

  }

}



resource "aws_iam_role" "terraform_iam_role" {

  name                = "terraform-iam-role"
  assume_role_policy  = data.aws_iam_policy_document.instance-assume-role-policy.json
  managed_policy_arns = [aws_iam_policy.terraform-policy.arn]

}