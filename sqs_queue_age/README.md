This Terraform script provisions an AWS CloudWatch Metric Alarm for an SQS queue. It monitors the age of the oldest message in the queue and sends a notification via SNS when the threshold is breached.

**File Structure**

```bash
.
├── sqs_alarm.tf     # CloudWatch alarm resource definition
├── variable.tf      # Input variable declarations
├── outputs.tf       # Output values after apply
└── README.md        # Project documentation
```

**Prerequisites**

Terraform >= 1.0\
AWS CLI configured with appropriate credentials\
An existing SQS queue\
An existing SNS topic ARN for alarm notifications


**Usage**

Initialize Terraform
```bash
terraform init
```
Review the plan
```bash
terraform plan
```
Apply the configuration
```bash
terraform apply
```
Destroy Resources
```bash
terraform destroy
```

**Outputs**

After a successful terraform apply, the following values will be displayed:
OutputDescriptionsqs_alarm_nameName of the SQS CloudWatch alarmsqs_alarm_arnARN of the SQS CloudWatch alarm
