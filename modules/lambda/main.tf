resource "aws_iam_role" "lambda_execution_role" {
  name = "${var.lambda_function_name}_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole",
        Sid    = ""
      },
    ]
  })
}

# resource "aws_iam_policy" "lambda_s3_access" {
#   name   = "${var.lambda_function_name}_s3_access"
#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action   = ["s3:GetObject", "s3:PutObject"],
#         Resource = ["arn:aws:s3:::${var.s3_bucket_name}/*","arn:aws:s3:::${var.s3_bucket_name}"],
#         Effect   = "Allow"
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "lambda_s3_access_attachment" {
#   role       = aws_iam_role.lambda_execution_role.name
#   policy_arn = aws_iam_policy.lambda_s3_access.arn
# }

resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_function_name
  filename         = var.lambda_zip_path
  source_code_hash = filebase64sha256(var.lambda_zip_path)
  handler       = var.lambda_handler
  role          = aws_iam_role.lambda_execution_role.arn
  runtime       = var.runtime
  # s3_bucket     = var.s3_bucket_name
  # s3_key        = var.lambda_zip_path

  kms_key_arn   = var.kms_key_arn

  # depends_on = [aws_iam_role_policy_attachment.lambda_s3_access_attachment]
}

