provider "aws" {
  region = var.region
}

resource "aws_cloudwatch_metric_alarm" "sqs_alarm" {
  alarm_name                = "CloudWatch_Alarms_sqs_approximateAgeOfOldestMessage_${var.queue_name}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "ApproximateAgeOfOldestMessage"
  namespace                 = "AWS/SQS"
  period                    = 300
  statistic                 = "Average"
  threshold                 = 10

  dimensions = {
    QueueName = var.queue_name
  }

  actions_enabled = true
  alarm_actions = [var.sqs_sns]
}