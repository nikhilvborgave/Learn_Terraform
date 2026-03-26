output "CPUUtilization_alarm_name" {
  description = "Name of the CPU Utilization CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.CPUUtilization.alarm_name
}

output "CPUUtilization_alarm_arn" {
  description = "ARN of the CPU Utilization CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.CPUUtilization.arn
}

output "FreeLocalStorage_alarm_name" {
  description = "Name of the Free Local Storage CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.FreeLocalStorage.alarm_name
}

output "FreeLocalStorage_alarm_arn" {
  description = "ARN of the Free Local Storage CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.FreeLocalStorage.arn
}

output "SelectThroughput_alarm_name" {
  description = "Name of the Select Throughput CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.SelectThroughput.alarm_name
}

output "SelectThroughput_alarm_arn" {
  description = "ARN of the Select Throughput CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.SelectThroughput.arn
}