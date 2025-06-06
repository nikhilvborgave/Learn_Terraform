terraform {
  source =  "../../project1-infra/modules/nlb"
}

remote_state {
  backend = "s3"

  config = {
    encrypt = true
    bucket = "dry_run-tfstate"
    key = "nlb/nlb.tfstate"
    region = "us-east-1"
    
  }
}


inputs = {
  region      = "us-east-1"
  nlb_name    = "project1-nlb-openvpn"
  bucket_name = "dry_run-tfstate"
}