resource "aws_sns_topic" "s3_bucket_creation_topic" {
  name = var.sns_audit_topic
}

# Subscription to SNS Topic for email notifications
resource "aws_sns_topic_subscription" "email_notification_subscription" {
  topic_arn = aws_sns_topic.s3_bucket_creation_topic.arn
  protocol  = "email"
  endpoint  = var.email_subscription_endpoint
}

resource "aws_sns_topic_policy" "cloudwatch_event_policy" {
  arn    = aws_sns_topic.s3_bucket_creation_topic.arn
  policy = data.aws_iam_policy_document.sns_policy_document.json
}
