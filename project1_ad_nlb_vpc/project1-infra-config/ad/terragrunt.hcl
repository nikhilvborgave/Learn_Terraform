terraform {
  source =  "../../project1-infra/modules/ad"
}

remote_state {
  backend = "s3"

  config = {
    encrypt = true
    bucket = "dry_run-tfstate"
    key = "ad/ad.tfstate"
    region = "us-east-1"
    
  }
}


inputs = {
  environment     = "project1-dev"
  region          = "us-east-1"
  name            = "ad.nikhil.com"
  ad_password     = 
  short_name      = "NIKHIL"
  bucket_name     = "dry_run-tfstate"
}