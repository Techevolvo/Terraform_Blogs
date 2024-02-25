# S3 Bucket for CloudTrail Trails
resource "aws_s3_bucket" "audit_bucket" {
  bucket = var.aws_s3_bucket_name
   tags = {
    Environment = "Dev"
  }
}

# S3 Bucket policy
resource "aws_s3_bucket_policy" "techevolvo_audit_bucket_policy" {
  bucket = aws_s3_bucket.audit_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}