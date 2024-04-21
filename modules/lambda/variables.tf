variable "aws_region" {
  description = "AWS region for the Lambda function"
  type        = string
  default     = "us-east-1"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

# variable "s3_bucket_name" {
#   description = "The name of the S3 bucket that the Lambda function will access"
#   type        = string
# }

variable "lambda_handler" {
  description = "The function entrypoint in your code"
  type        = string
}

variable "runtime" {
  description = "The identifier of the function's runtime"
  type        = string
  default     = "python3.0"
}

variable "lambda_zip_path" {
  description = "Path to the Lambda function code ZIP file"
  type        = string
}

variable "kms_key_arn" {
  type = string
}