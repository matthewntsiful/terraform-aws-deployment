# Terraform AWS Deployment

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat-square&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/aws-%23FF9900.svg?style=flat-square&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![Contributors](https://img.shields.io/github/contributors/matthewntsiful/terraform-aws-deployment?style=flat-square)](https://github.com/matthewntsiful/terraform-aws-deployment/graphs/contributors)

This repository contains Terraform configurations for deploying a multi-environment AWS infrastructure. The deployment is structured to support development, staging, and production environments with separate state files and configurations for each.

## 🚀 Features

- **Multi-environment Support**: Separate configurations for dev, staging, and prod environments
- **Modular Design**: Reusable Terraform modules for consistent infrastructure
- **Secure State Management**: Remote state storage with proper access controls
- **CI/CD Ready**: Designed for integration with CI/CD pipelines
- **Infrastructure as Code**: Version-controlled infrastructure definitions

## Project Structure

```
terraform-aws-deployment/
├── environments/               # Environment-specific configurations
│   ├── dev/                    # Development environment
│   │   ├── backend.tf          # Backend configuration for state storage
│   │   ├── main.tf             # Main Terraform configuration
│   │   ├── variables.tf        # Variable definitions
│   │   ├── outputs.tf          # Output values
│   │   └── terraform.tfvars    # Environment-specific variables
│   ├── staging/                # Staging environment (same structure as dev)
│   └── prod/                   # Production environment (same structure as dev)
└── .gitignore                 # Git ignore file
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0.0
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- AWS account with necessary permissions
- SSH key pair for EC2 instance access

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/matthewntsiful/terraform-aws-deployment.git
cd terraform-aws-deployment
```

### 2. Configure Environment Variables

Copy the example environment file and update with your values:

```bash
cp environments/dev/terraform.tfvars.example environments/dev/terraform.tfvars
```

### 3. Initialize Terraform

Navigate to the desired environment directory and initialize Terraform:

```bash
cd environments/dev
terraform init
```

### 4. Plan and Apply

Review the execution plan and apply the configuration:

```bash
terraform plan
terraform apply
```

## Environment Configuration

Each environment (dev, staging, prod) has its own configuration in the `environments` directory. The main differences between environments are:

- **Development**: Lower resource limits, more verbose logging
- **Staging**: Mirrors production with reduced scale
- **Production**: Full-scale deployment with production-grade settings

## Module Usage

This deployment uses the following modules from the `terraform-aws-modules` repository:

- **VPC**: Network infrastructure including subnets, route tables, and NAT gateways
- **EC2**: Compute instances with auto-scaling groups
- **Security Groups**: Network access controls
- **RDS**: Managed database instances
- **ALB**: Application Load Balancer for traffic distribution

## Managing State

Each environment maintains its own remote state file in an S3 bucket with state locking via DynamoDB. The backend configuration is defined in `backend.tf`.

## Security

- IAM roles and policies follow the principle of least privilege
- Sensitive values are managed using Terraform's sensitive variables
- All resources are tagged appropriately for cost allocation and management

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Best Practices](https://www.terraform-best-practices.com/)

---

<div align="center">
  Made with ❤️ by <a href="https://github.com/matthewntsiful">Matthew Ntsiful</a> & <a href="https://github.com/Edwendy">Edith Sosu</a>
</div>
