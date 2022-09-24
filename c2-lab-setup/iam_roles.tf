###########################################################################

# IAM Role for Target


resource "aws_iam_policy" "target_iam_policy" {

  name = "target-policy"
  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [
      {
        Action = [
          "s3:Get*",
          "s3:List*",
          "s3-object-lambda:Get*",
          "s3-object-lambda:List*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]

  })

}




data "aws_iam_policy_document" "iam_document" {

  statement {

    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

  }

}




resource "aws_iam_role" "target_iam_role" {

  name                = "target-iam-role"
  assume_role_policy  = data.aws_iam_policy_document.iam_document.json
  managed_policy_arns = [aws_iam_policy.target_iam_policy.arn]

}




resource "aws_iam_instance_profile" "target_iam_role_profile" {

  name = "target-iam-role-profile"
  role = aws_iam_role.target_iam_role.name

}


###########################################################################


# IAM Role for Redirector

resource "aws_iam_policy" "redirector_iam_policy" {

  name = "redirector-policy"
  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [
      {
        Action = [
          "ec2:*"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:ec2:*:086534668924:instance/*"
      }
    ]

  })

}



resource "aws_iam_role" "redirector_iam_role" {

  name                = "redirector-iam-role"
  assume_role_policy  = data.aws_iam_policy_document.iam_document.json
  managed_policy_arns = [aws_iam_policy.redirector_iam_policy.arn]

}




resource "aws_iam_instance_profile" "redirector_iam_role_profile" {

  name = "redirector-iam-role-profile"
  role = aws_iam_role.redirector_iam_role.name

}



###########################################################################

# IAM Role for C2-Server


resource "aws_iam_policy" "c2_iam_policy" {

  name = "c2-policy"
  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [
      {
        Action = [
          "ec2:*"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:ec2:*:086534668924:instance/*"
      }
    ]

  })

}




resource "aws_iam_role" "c2_iam_role" {

  name                = "c2-iam-role"
  assume_role_policy  = data.aws_iam_policy_document.iam_document.json
  managed_policy_arns = [aws_iam_policy.c2_iam_policy.arn]

}



resource "aws_iam_instance_profile" "c2_iam_role_profile" {

  name = "c2-iam-role-profile"
  role = aws_iam_role.c2_iam_role.name

}