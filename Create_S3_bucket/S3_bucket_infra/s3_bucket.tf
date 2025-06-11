provider "aws" {
    region = var.region
}

terraform {
  backend "s3" {}
}

resource "aws_s3_bucket" "test-bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.bucket_environment
  }
}

resource "aws_s3_bucket_versioning" "versioning_test" {
  bucket = aws_s3_bucket.test-bucket.id
  versioning_configuration {
    status = var.versioning_status
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_test" {
  bucket = aws_s3_bucket.test-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.bucket_encryption
    }
  }
}