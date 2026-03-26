output "sqs_alarm_name" {
  description = "Name of the sqs_alarm"
  value       = aws_cloudwatch_metric_alarm.sqs_alarm.alarm_name
}

output "sqs_alarm_arn" {
  description = "ARN of the SQS CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.sqs_alarm.arn
}