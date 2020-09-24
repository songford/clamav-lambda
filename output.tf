output "s3_bucket" {
  value = aws_s3_bucket.scan_candidate_bucket.id
  description = "The bucket name of the target where you should upload scan candidates."
}