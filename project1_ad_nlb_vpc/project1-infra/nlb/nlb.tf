provider "aws" {
  region  = var.region
}

terraform {
  backend "s3" { }
}

data "terraform_remote_state" "vpc_state" {
    backend = "s3"
    config = {
        bucket = var.bucket_name
        key    = "vpc/vpc.tfstate"
        region = var.region
    }
}



resource "aws_lb" "openvpn" {
  name               = var.nlb_name
  load_balancer_type = "network"
  enable_deletion_protection = false

  subnet_mapping {
    subnet_id     = data.terraform_remote_state.vpc_state.outputs.subnet_public0
    allocation_id = aws_eip.openvpn.id
  }

  
}

resource "aws_eip" "openvpn" {
  domain = "vpc"
}