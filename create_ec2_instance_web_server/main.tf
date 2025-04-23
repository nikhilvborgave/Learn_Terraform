provider "aws" {
    region = var.region
}

resource "aws_instance" "terraform_instance" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = ["${aws_security_group.terraform_test_example_sg.id}"]

    user_data = <<-EOF
                #!/bin/bash
                echo "Hello World" > index.html
                nohup busybox httpd -f -p "${var.server_port}" &
                EOF

    tags = {
        Name = var.ec2_tag
    }
}

resource "aws_security_group" "terraform_test_example_sg" {
    name = "terraform_test_example_sg"
  
}

resource "aws_vpc_security_group_ingress_rule" "allow_8080" {
  security_group_id = aws_security_group.terraform_test_example_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.server_port
  ip_protocol       = "tcp"
  to_port           = var.server_port
}