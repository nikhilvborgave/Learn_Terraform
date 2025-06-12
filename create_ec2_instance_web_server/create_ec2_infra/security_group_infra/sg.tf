provider "aws" {
  region  = var.region
}

terraform {
  backend "s3" { }    
}

# data "terraform_remote_state" "vpc_state" {   
#     backend = "s3"
#     config = {
#         bucket = var.bucket_name
#         key    = "vpc/vpc.tfstate"    
#         region = var.region
#     }
# }


resource "aws_security_group" "test-sg" {
  name        = var.sg_name
  description = "Allow HTTP inbound traffic"
  # vpc_id      = data.terraform_remote_state.vpc_state.outputs.vpcid

  tags = {
    Name = var.sg_name
  }
}

resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.test-sg.id
}

resource "aws_security_group_rule" "redis" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  cidr_blocks       = ["10.10.0.0/16"]
  security_group_id = aws_security_group.test-sg.id
}

resource "aws_security_group_rule" "rdp" {
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.test-sg.id
}

resource "aws_security_group_rule" "outbound" {
  type              = "egress"  
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.test-sg.id
}