output "target_group_test" {
  value = aws_lb_target_group.test-terrafom.arn
}

output "alb_test" {
  value = aws_lb.test-terraform.arn
}
