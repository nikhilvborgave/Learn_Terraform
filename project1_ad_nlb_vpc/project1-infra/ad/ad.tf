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



resource "aws_directory_service_directory" "test" {
  name     = var.name
  password = var.ad_password
  short_name = var.short_name
  edition  = "Standard"
  type     = "MicrosoftAD"

  vpc_settings {
    vpc_id     = data.terraform_remote_state.vpc_state.outputs.vpcid
    subnet_ids = [
      data.terraform_remote_state.vpc_state.outputs.subnet_private0,
      data.terraform_remote_state.vpc_state.outputs.subnet_private1, 
    ]
  }

  tags = {
    Project = "test-ad"
  }
}