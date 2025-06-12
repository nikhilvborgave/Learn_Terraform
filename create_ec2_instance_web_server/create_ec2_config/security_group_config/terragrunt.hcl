terraform {
  source =  "../../create_ec2_infra/security_group_infra"
}

remote_state {
  backend = "s3"

  config = {
    encrypt = true
    bucket = "254466556549-terraform-tfstate"
    key = "sg/sg.tfstate"
    region = "us-east-1"
    
  }
}

inputs = {
  region                = "us-east-1"
  sg_name               = "test-sg"
  bucket_name           = "254466556549-terraform-tfstate"
  
  }