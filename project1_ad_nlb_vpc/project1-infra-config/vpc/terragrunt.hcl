terraform {
  source =  "../../project1-infra/modules/vpc"
}

remote_state {
  backend = "s3"

  config = {
    encrypt = true
    bucket = "dry_run-tfstate"
    key = "vpc/vpc.tfstate"
    region = "us-east-1"
    
  }
}


inputs = {
  environment           = "project1-dev"
  region                = "us-east-1"
  vpc_cidr              = "10.15.0.0/16"
  public0_subnet_cidr   = "10.15.74.0/24"
  public1_subnet_cidr   = "10.15.72.0/24"
  private0_subnet_cidr  = "10.15.82.0/24"
  private1_subnet_cidr  = "10.15.58.0/24"
}