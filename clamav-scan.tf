resource "aws_iam_role" "clamav-scan-iam-role" {
  assume_role_policy = data.aws_iam_policy_document.clamav-scan-iam-policy.json
}

resource "aws_cloudwatch_log_group" "clamav-virus-scan" {
  retention_in_days = 7
}