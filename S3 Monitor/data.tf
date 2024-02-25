data "aws_caller_identity" "current" {}


# SNS Policy Document for events
data "aws_iam_policy_document" "sns_policy_document" {
  statement {
    effect  = "Allow"
    actions   = ["sns:Publish"]
    resources = [aws_sns_topic.s3_bucket_creation_topic.arn]
    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
}

# S3 bucket policy to allow CloudTrail to write logs
data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    effect = "Allow"
    actions   = ["s3:GetBucketAcl"]
    resources = [aws_s3_bucket.audit_bucket.arn]
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
  }
  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.audit_bucket.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
  }
}
