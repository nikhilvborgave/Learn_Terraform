# Terraform Project 1 — Basic EC2 With Security Group & User Data

This project demonstrates the fundamentals of Terraform on AWS by deploying a single EC2 instance with a security group and automated provisioning using a user-data script.

The goal of this project is to showcase:
- Clean Terraform file structure  
- EC2 provisioning  
- Security Group creation  
- User data automation  
- Remote backend usage (S3 state storage)  
- Variables & outputs  
- Basic infrastructure tagging  


## Architecture
```bash
Terraform deploys the following:

- **EC2 instance (t2.micro)** running Ubuntu 22.04  
- **Security Group** with:
  - Port 22 (SSH)  
  - Port 80 (HTTP)  
- **User Data** installs & configures Nginx  
- **S3 Backend** for remote Terraform state  

[Terraform] → [AWS] → EC2 + Security Group + Nginx Setup
```

## Project Structure

```bash
project-folder/
├── main.tf
├── variables.tf
├── outputs.tf
└── user_data.sh
```



## How to Deploy

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Preview resources
```bash
terraform plan
```

### 3. Deploy infrastructure
```bash
terraform apply -auto-approve
```

### 4. View Outputs
```bash
Terraform prints:
- EC2 Instance ID  
- Public IP  
- Private IP  
- Security Group ID  

Open the public IP in your browser to see the Nginx homepage deployed via user data.
```

## What This Project Does
```bash
- Creates a free-tier EC2 instance  
- Provisions Nginx via user-data  
- Attaches a minimal Security Group  
- Stores Terraform state in an S3 bucket (remote backend)  
- Outputs useful instance information  
```

## User Data Script
```bash
The EC2 instance automatically:

- Updates packages  
- Installs Nginx  
- Enables UFW firewall  
- Allows SSH + HTTP  
- Creates a custom index.html page  

User data file: user_data.sh
```

## Terraform Concepts Demonstrated
```bash
- Providers  
- Variables  
- Outputs  
- Security Groups  
- EC2  
- User data  
- Remote state backend  
- Tags  
- AWS Ubuntu AMIs  
```

## Author

Nikhil Borgave  
GitHub: https://github.com/nikhilvborgave
