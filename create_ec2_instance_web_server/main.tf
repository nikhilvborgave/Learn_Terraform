provider "aws" {
    region = "us-east-1"
}

variable "server_port" {
    description = "The port the server will use for HTTP request"
    default = 8080
}

output "public_ip" {
    value = "${aws_instance.terraform_instance.public_ip}"
}

resource "aws_instance" "terraform_instance" {
    ami = "ami-00a929b66ed6e0de6"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.terraform_test_example_sg.id}"]

    user_data = <<-EOF
                #!/bin/bash
                echo "Hello World" > index.html
                nohup busybox httpd -f -p "${var.server_port}" &
                EOF

    tags = {
        Name = "terraform_test_example"
    }
}

resource "aws_security_group" "terraform_test_example_sg" {
    name = "terraform_test_example_sg"
  
}

resource "aws_vpc_security_group_ingress_rule" "allow_8080" {
  security_group_id = aws_security_group.terraform_test_example_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = "${var.server_port}"
  ip_protocol       = "tcp"
  to_port           = "${var.server_port}"
}