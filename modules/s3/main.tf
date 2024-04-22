resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  # region = var.aws_region

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.bucket.id
  
  versioning_configuration {
    status = try(var.versioning["enabled"] ? "Enabled" : "Suspended", tobool(var.versioning["status"]) ? "Enabled" : "Suspended", title(lower(var.versioning["status"])))
  }
}

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = var.block_public_access["block_public_acls"]
  block_public_policy     = var.block_public_access["block_public_policy"]
  ignore_public_acls      = var.block_public_access["ignore_public_acls"]
  restrict_public_buckets = var.block_public_access["restrict_public_buckets"]
}