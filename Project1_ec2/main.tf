provider "aws" {
    region = var.region
}

terraform {
  backend "s3" {
    bucket = "bucket_name"    #redacted bucket name
    key = "ec2/ec2.tfstate"
    region = "us-east-1"
    encrypt = true
    #dynamodb_table = "value"
  }
}

resource "aws_security_group" "project1-sg" {
  name = var.sg_name
  description = var.sg_description
  tags = {
    Name = var.sg_name
    created_by = "terraform_script"
  }
}

resource "aws_security_group_rule" "http" {
    type = "ingress"
    security_group_id = aws_security_group.project1-sg.id
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh" {
    type = "ingress"
    security_group_id = aws_security_group.project1-sg.id
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress_rule" {
  type = "egress"
  security_group_id = aws_security_group.project1-sg.id
  from_port = 0
  to_port = 0
  protocol = "All"
  cidr_blocks = ["0.0.0.0/0"]
  
}

resource "aws_instance" "ec2_project1" {
    ami = var.ami
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.project1-sg.id]
    key_name = "terraform_project1"
    user_data = file("user_data.sh")
    tags = {
      Name = var.ec2_name
      created_by = "terraform_script"
    }
}