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
        key    = "vpc/vpc.tfstate"    #need to mention vpc so providing path to vpc tf file
        region = var.region
    }
}

data "terraform_remote_state" "ec2_state" {   
    backend = "s3"
    config = {
        bucket = var.bucket_name
        key    = "ec2/ec2.tfstate" 
        region = var.region
    }
}

data "terraform_remote_state" "sg_state" {   
    backend = "s3"
    config = {
        bucket = var.bucket_name
        key    = "sg/sg.tfstate"    
        region = var.region
    }
}

resource "aws_lb_target_group" "test-terrafom" {
        health_check {
        interval            = 10
        path                = "/"
        protocol            = "HTTP"
        timeout             = 5
        healthy_threshold   = 5
        unhealthy_threshold = 2
    }
  name     = "test-terrafom"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = data.terraform_remote_state.vpc_state.outputs.vpcid
}

#attaching ec2 to target group

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = "${aws_lb_target_group.test-terrafom.arn}"
  target_id        = data.terraform_remote_state.ec2_state.outputs.instanceid
  port             = 80 

}

#creating alb

resource "aws_lb" "test-terraform" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.terraform_remote_state.sg_state.outputs.sgid]
  
  subnet_mapping {
    subnet_id     = data.terraform_remote_state.vpc_state.outputs.subnet_public0
  }


  subnet_mapping {
    subnet_id     = data.terraform_remote_state.vpc_state.outputs.subnet_public1
  }
}

#adding listener to alb

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "${aws_lb.test-terraform.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test-terrafom.arn
  }
}