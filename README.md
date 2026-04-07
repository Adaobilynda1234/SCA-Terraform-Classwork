# Terraform AWS Beginner Project

## Overview

This project demonstrates how to use Terraform to provision AWS infrastructure, including EC2 instances, S3 buckets, security groups, and VPC networking.

---

## Tools Used

* Terraform
* AWS
* VS Code
* WSL (Ubuntu)

---

## Project Structure

* task-1-ec2 → EC2 instance
* task-2-s3 → S3 bucket with versioning
* task-3-security-group → Secure access rules
* task-4-vpc → Custom network
* task-5-ec2-vpc → EC2 inside VPC

---

## Setup Instructions

1. Install Terraform
2. Install AWS CLI
3. Configure AWS:

   ```bash
   aws configure
   ```

---

## How to Run

```bash
terraform init
terraform plan
terraform apply
```

---

## Key Concepts

### Provider

Connects Terraform to AWS.

### Resource

Defines infrastructure (EC2, S3, etc.).

### Tags

Used for identification and organization.

---

## Screenshots

All screenshots are in the `screenshots/` folder.

---


## Answer to questions
## Task 1: EC2 Instance
### Explanation
- Provider: tells Terraform which cloud platform to use and how to authenticate
- Resource: defines the infrastructure component to create (in this case, an EC2 instance)
- Tags: metadata attached to resources for identification, cost tracking, and organization
## Task 2: Create an S3 Bucket for Application Backups

### Explanation
- Why versioning?
- Prevents accidental deletion — deleted objects are hidden with a delete marker, not permanently removed
- Keeps old file versions — every upload creates a new version, old ones are retained
- Enables recovery — you can restore any previous version of an object at any time

## Task 3: Build a Secure Security Group for a Web Server
### Explanation
- Short explanation of why allowing SSH from 0.0.0.0/0 is bad practice:
- Anyone on the internet can attempt to access your server.
- High risk of brute-force and credential attacks.
- Best practice: restrict to your specific IP using `YOUR_IP/32` instead of `0.0.0.0/0`.

## Task 4: Provision a Simple VPC Network

### Explanation
- Short explanation of the role of:
### Explanation

- **VPC** → A logically isolated virtual network in AWS where you define your IP range and host all your resources. Used `10.0.0.0/16` giving 65,536 available addresses.

- **Subnet** → A subdivision of the VPC's IP range scoped to one Availability Zone. A subnet becomes public only when its route table has a route to an Internet Gateway.

- **Internet Gateway** → The entry/exit point between your VPC and the public internet. Attaching it to the VPC alone isn't enough — traffic only flows if the route table directs through it.

- **Route Table** → Rules that control where network traffic is directed. The key rule `0.0.0.0/0 → IGW` is what makes the subnet truly public.

## Task 5: Deploy an EC2 Instance Inside a Custom VPC

### Explanation
- Brief explanation of how Terraform allows infrastructure to be reused across related resources:

Terraform uses resource references (e.g. `aws_vpc.main.id`) to link resources together.
This means:
- No hardcoding IDs — values are passed automatically between resources
- Implicit dependency — Terraform knows to create the VPC before the subnet because the subnet references it
- Single source of truth — change the VPC once and all dependent resources pick it up automatically


## Notes

* Do not commit `.tfstate` files
* Use `.gitignore` for sensitive files

---

## Author

Adaobi okwuosa
