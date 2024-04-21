output "bucket_id" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.bucket.arn
}

output "kms_key_arn" {
  description = "The ARN of the KMS key"
  value       = aws_kms_key.mykey.arn
}