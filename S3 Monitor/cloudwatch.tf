# CloudWatch Event Rule for S3 bucket creation
resource "aws_cloudwatch_event_rule" "s3_bucket_creation_rule" {
  name        = "s3-bucket-creation-rule"
  description = "Rule to detect S3 bucket creation"

  event_pattern = <<EOF
{
  "source": ["aws.s3"],
  "detail-type": ["AWS API Call via CloudTrail"],
  "detail": {
    "eventSource": ["s3.amazonaws.com"],
    "eventName": ["CreateBucket", "DeleteBucket"]
  }
}
EOF
}

# CloudWatch Event Target for SNS notification
resource "aws_cloudwatch_event_target" "s3_bucket_creation_target" {
  rule      = aws_cloudwatch_event_rule.s3_bucket_creation_rule.name
  target_id = "s3-bucket-creation-target"
  arn       = aws_sns_topic.s3_bucket_creation_topic.arn
}
