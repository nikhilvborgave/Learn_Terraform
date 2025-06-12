terraform {
  source =  "../../create_ec2_infra/ec2_infra"
}

remote_state {
  backend = "s3"

  config = {
    encrypt = true
    bucket = "254466556549-terraform-tfstate"
    key = "ec2/ec2.tfstate"
    region = "us-east-1"
    
  }
}

inputs = {
  region      = "us-east-1"
  ami         =  "ami-00a929b66ed6e0de6"
  instance_type = "t2.micro"
  bucket_name   = "254466556549-terraform-tfstate"
  ec2_tag       = "terraform_ec2"
}