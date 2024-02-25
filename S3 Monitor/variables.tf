variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "aws_s3_bucket_name" {
  type        = string
  description = "S3 Bucket name for Audits"
  default     = "techevolvo-audit-bucket"
}

variable "sns_audit_topic" {
  type        = string
  description = "SNS Topic name for Audits"
  default     = "audit-sns-topic"

}

variable "email_subscription_endpoint" {
  description = "Email address to receive SNS notifications"
  default     = "info@techevolvo.com"
}
