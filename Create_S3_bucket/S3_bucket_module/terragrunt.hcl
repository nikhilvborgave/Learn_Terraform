terraform {
  source =  "../S3_bucket_infra"
}

remote_state {
  backend = "s3"

  config = {
    bucket       = "254466556549-terraform-tfstate"
    region       = "us-east-1"
    key          = "terraform/state.tfstate"
  }
}


inputs = {
  region                = "us-east-1"
  bucket_name           = "254466556549-test-bucket-from-terraform"
  bucket_environment    = "testing"
  versioning_status     = "Enabled"
  bucket_encryption     = "AES256"
}