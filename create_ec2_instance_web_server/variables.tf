variable "server_port" {
    description = "The port the server will use for HTTP request"
    default = "8080"
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default = "us-east-1"
}

variable "ami" {
    description = "ami image id of ec2 instance"
    type = string
    default = "ami-00a929b66ed6e0de6"
}

variable "instance_type" {
    description = "instance type of ec2 instance"
    type = string
    default = "t2.micro"
}

variable "ec2_tag" {
    description = "name tag for ec2"
    type = string
    default = "terraform_ec2" 
}