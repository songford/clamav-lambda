resource "aws_s3_bucket" "scan_candidate_bucket" {
  bucket_prefix = "scan-candidate"
  lifecycle_rule {
    enabled = true
    expiration {
      days = 3
    }
  }
}

resource "aws_s3_bucket" "clamav-bin" {
  bucket_prefix = "clamav-bin"

}

resource "aws_s3_bucket_object" "main_cvd" {
  bucket = aws_s3_bucket.clamav-bin.bucket
  key = "main.cvd"
  source = "${path.module}/main.cvd"
  etag = filemd5("${path.module}/main.cvd")
}

resource "aws_s3_bucket_object" "daily_cvd" {
  bucket = aws_s3_bucket.clamav-bin.bucket
  key = "daily.cvd"
  source = "${path.module}/daily.cvd"
  etag = filemd5("${path.module}/daily.cvd")
}

resource "aws_s3_bucket_object" "bytecode_cvd" {
  bucket = aws_s3_bucket.clamav-bin.bucket
  key = "bytecode.cvd"
  source = "${path.module}/bytecode.cvd"
  etag = filemd5("${path.module}/bytecode.cvd")
}

resource "aws_s3_bucket_notification" "scan_pending_notification" {
  bucket = aws_s3_bucket.scan_candidate_bucket.id
  lambda_function {
    lambda_function_arn = aws_lambda_function.clamav-scan.arn
    events = ["s3:ObjectCreated:*"]
  }
  depends_on = [aws_lambda_permission.allow_bucket]
}

resource "aws_lambda_permission" "allow_bucket" {
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.clamav-scan.function_name
  principal = "s3.amazonaws.com"
  source_arn = aws_s3_bucket.scan_candidate_bucket.arn
}