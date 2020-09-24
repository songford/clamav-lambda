resource "aws_iam_role" "clamav-scan-iam-role" {
  name_prefix = "clamav-scan-iam-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_cloudwatch_log_group" "clamav-virus-scan" {
  retention_in_days = 7
}

resource "aws_lambda_function" "clamav-scan"{
  function_name = "clamav-scan-terraform"
  handler = "org.sap.clamav.Scan"
  role = aws_iam_role.clamav-scan-iam-role.arn
  runtime = "java11"
  filename = "clamav-scan-1.0-SNAPSHOT.zip"
  layers = [aws_lambda_layer_version.clamav-bin-layer.id]
}

resource "aws_lambda_layer_version" "clamav-bin-layer" {
  layer_name = "clamav-bin-layer"
  s3_bucket = "clamav-bin"
  s3_key = "clamav.zip"
}