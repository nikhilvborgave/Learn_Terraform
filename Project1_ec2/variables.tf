variable "region" {
    description = "default region where this terraform script will run"
    type = string
    default = "ap-south-1"
}

variable "sg_name" {
    description = "Name of security group for project1"
    default = "project1-sg"
    type = string
}

variable "sg_description" {
    description = "description of project1-sg"
    type = string
    default = "this sg is created using terraform script for project1" 
}

variable "ami" {
    description = "ami id of ubuntu22.04"
    type = string
    default = "ami-087d1c9a513324697" 
}

variable "ec2_name" {
    description = "name of ec2 instance"
    type = string
    default = "ec2_project1"
  
}