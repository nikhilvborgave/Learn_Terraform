output "instance_id" {
    value = aws_instance.ec2_project1.id
}

output "instance_ip" {
  value = aws_instance.ec2_project1.private_ip
}

output "instance_public_ip" {
  value = aws_instance.ec2_project1.public_ip
}

output "security_group_id" {
  value = aws_security_group.project1-sg.id
}