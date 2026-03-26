variable "region" {
    description = "default region where this terraform script will run"
    type = string
    default = "us-east-1"
}

variable "db_name" {
    description = "Name of the Database"
    type = string
    default = "test-db-private-cluster"
}

variable "CPUUtilization_sns" {
    description = "sns arn when cloudwatch is in alarm state"
    type = string
    default = "arn:aws:sns:us-east-1:account_id:testcpuutilization"
}

variable "FreeLocalStorage_sns" {
    description = "sns arn when cloudwatch is in alarm state"
    type = string
    default = "arn:aws:sns:us-east-1:account_id:testfreelocalstorage"
}

variable "SelectThroughput_sns" {
    description = "sns arn when cloudwatch is in alarm state"
    type = string
    default = "arn:aws:sns:us-east-1:account_id:testselectthroughput"
}