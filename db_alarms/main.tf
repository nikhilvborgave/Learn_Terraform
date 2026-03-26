provider "aws" {
  region = var.region
}

resource "aws_cloudwatch_metric_alarm" "CPUUtilization" {
  alarm_name                = "CloudWatch_Alarms_rds_cpu_utilization_${var.db_name}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/RDS"
  period                    = 300
  statistic                 = "Average"
  threshold                 = 90

  dimensions = {
    DBInstanceIdentifier = var.db_name
  }

  actions_enabled = true
  alarm_actions = [var.CPUUtilization_sns]
}


resource "aws_cloudwatch_metric_alarm" "FreeLocalStorage" {
  alarm_name                = "CloudWatch_Alarms_rds_free_local_storage_${var.db_name}"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = 1
  metric_name               = "FreeLocalStorage"
  namespace                 = "AWS/RDS"
  period                    = 300
  statistic                 = "Average"
  threshold                 = 10000000000

  dimensions = {
    DBInstanceIdentifier = var.db_name
  }

  actions_enabled = true
  alarm_actions = [var.FreeLocalStorage_sns]
}


resource "aws_cloudwatch_metric_alarm" "SelectThroughput" {
  alarm_name                = "CloudWatch_Alarms_rds_read_iops_${var.db_name}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  metric_name               = "SelectThroughput"
  namespace                 = "AWS/RDS"
  period                    = 300
  statistic                 = "Average"
  threshold                 = 2000

  dimensions = {
    DBInstanceIdentifier = var.db_name
  }

  actions_enabled = true
  alarm_actions = [var.SelectThroughput_sns]
}