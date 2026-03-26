This Terraform script provisions AWS CloudWatch Metric Alarms for an RDS instance. It monitors CPU utilization, free local storage, and select throughput, and sends notifications via SNS when thresholds are breached.

**File Structure**

```bash
.
├── main.tf          # CloudWatch alarm resource definitions
├── variable.tf      # Input variable declarations
├── output.tf        # Output values after apply
└── README.md        # Project documentation
```

**Prerequisites**

Terraform >= 1.0\
AWS CLI configured with appropriate credentials\
An existing RDS instance\
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
