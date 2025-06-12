provider "aws" {
  region  = var.region
}

terraform {
  backend "s3" { }    
}


data "terraform_remote_state" "sg_state" {   
    backend = "s3"
    config = {
        bucket = var.bucket_name
        key    = "sg/sg.tfstate"    #need to mention vpc so providing path to vpc tf file
        region = var.region
    }
}

# data "terraform_remote_state" "vpc_state" {   
#     backend = "s3"
#     config = {
#         bucket = var.bucket_name
#         key    = "vpc/vpc.tfstate"    #need to mention vpc so providing path to vpc tf file
#         region = var.region
#     }
# }

resource "aws_instance" "VPC_terraform_instance" {  
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "terraform_test"
  # subnet_id       = data.terraform_remote_state.vpc_state.outputs.subnet_private1
  vpc_security_group_ids = [data.terraform_remote_state.sg_state.outputs.sgid]
  #["sg-0dd7a6352773db321"]

  tags = {
    Name = var.ec2_tag
  }
    
}