# CloudTrail for S3 bucket monitoring
resource "aws_cloudtrail" "s3_bucket_monitoring" {
  name                          = "s3-bucket-monitoring"
  s3_bucket_name                = aws_s3_bucket.audit_bucket.id
  enable_logging                = true
  include_global_service_events = true
}
