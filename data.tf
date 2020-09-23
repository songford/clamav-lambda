data "aws_iam_policy_document" "clamav-scan-iam-policy" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "ec2:CreateNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface"
    ]
    resources = [
      "*"
    ]
    effect = "Allow"
  }

  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    effect = "Allow"
    resources = [
      aws_cloudwatch_log_group.clamav-virus-scan.arn
    ]
  }

  statement {
    actions = [
      "s3:GetAccessPoint",
      "s3:PutAccountPublicAccessBlock",
      "s3:GetAccountPublicAccessBlock",
      "s3:ListAllMyBuckets",
      "s3:ListAccessPoints",
      "s3:ListJobs",
      "s3:CreateJob",
      "s3:HeadBucket"
    ]
    resources = [
      "*"
    ]
    effect = "Allow"
  }
}