# Terraform & Terragrunt Infrastructure Repository

This repository demonstrates best practices for managing AWS infrastructure using Terraform and Terragrunt. It contains reusable Terraform modules and Terragrunt configurations to deploy resources such as VPC, S3 buckets, IAM Roles for Service Account, EKS and RDS.

## Overview

- **Modular Terraform Code**: Reusable modules for common AWS resources.
- **Terragrunt Environment Configurations**: Separate configurations for different environments (e.g., `dev`, `prod`) to avoid duplication and enforce consistency.


## Prerequisites

- **Terraform**: v1.10 or higher
- **Terragrunt**: v0.72.5 or higher  
  ([Terragrunt Docs](https://terragrunt.gruntwork.io/docs/))
- **AWS CLI**: Configured with proper [AWS credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
- **kubectl**: [kubernetes](https://kubernetes.io/docs/tasks/tools/)
## Getting Started

### 1.Clone the Repository
git clone https://github.com/passakornit/terraform.git
cd terraform

### 2.Configure AWS Credentials:
Ensure your AWS credentials are configured:
aws configure

### 3.Update Terragrunt Configuration:
Modify the terragrunt.hcl file to specify your remote state backend (e.g., S3 bucket for Terraform state)

### 4.Initialize and Deploy
Each environment has its own terragrunt.hcl file in the environments/ directory. Update these files with your specific values (e.g., AWS region, VPC IDs, resource names).
Navigate to your environment (e.g., dev/live):
cd live/dev/vpc
terragrunt init

To preview the changes:
terragrunt plan

To deploy the infrastructure:
terragrunt apply

#### VPC Module
Purpose: Provisions an VPC using the [terraform-aws-modules/vpc/aws](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest) module.

#### EKS Module
Purpose: Provisions an EKS and Karpenter using the [terraform-aws-modules/eks/aws](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest) and [terraform-aws-modules/eks/aws/submodules/karpenter](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest/submodules/karpenter) module.

#### S3 Module
Purpose: Provisions an S3 bucket using the [terraform-aws-modules/s3-bucket/aws](https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest) module.

#### IRSA Module
Purpose: Creates an IAM role for service accounts (IRSA) in EKS to enable pod-level access to AWS services (e.g., S3).[terraform-aws-modules/iam/aws](https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/latest) module.

#### RDS
Provisions an RDS using the [terraform-aws-modules/rds/aws](https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/latest) module.


# Additional Resources
[Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
[Terragrunt Documentation](https://terragrunt.gruntwork.io/docs/)
[AWS Provider for Terraform module](https://registry.terraform.io/search/modules?namespace=terraform-aws-modules)