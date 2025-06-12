output "instanceid" {
  value = aws_instance.VPC_terraform_instance.id
}

output "instance_ip" {
  value = aws_instance.VPC_terraform_instance.public_ip
}
