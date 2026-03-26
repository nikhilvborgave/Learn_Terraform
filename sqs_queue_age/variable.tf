variable "region" {
    description = "default region where this terraform script will run"
    type = string
    default = "us-east-1"
}

variable "queue_name" {
    description = "Name of the sqs queue"
    type = string
    default = "test_sqs"
}

variable "sqs_sns" {
    description = "sns arn when cloudwatch is in alarm state"
    type = string
    default = "arn:aws:sns:us-east-1:account_id:test"
}