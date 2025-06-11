output "bucket-name" {
    value = aws_s3_bucket.test-bucket.id
}

output "encryption" {
    value = aws_s3_bucket_server_side_encryption_configuration.encryption_test.rule
  
}

output "versioning" {
    value = aws_s3_bucket_versioning.versioning_test.versioning_configuration
}