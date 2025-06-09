terraform {
  source =  "../../infra/alb_infra/"
}

remote_state {
  backend = "s3"

  config = {
    encrypt = true
    bucket = "dry_run"
    key = "alb/alb.tfstate"
    region = "us-east-1"
    
  }
}


inputs = {
  region      = "us-east-1"
  alb_name    = "test-alb"
  bucket_name = "dry_run"

  
}