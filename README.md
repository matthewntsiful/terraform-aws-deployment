# Terraform AWS Deployment

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)

This repository contains Terraform configurations for deploying a multi-environment AWS infrastructure using reusable modules. The deployment includes VPC, EC2 instances, and security groups configured for development, staging, and production environments.

## Project Structure

```
terraform-aws-deployment/
├── environments/
│   ├── dev/                  # Development environment
│   │   ├── main.tf           # Main configuration
│   │   ├── variables.tf      # Variable definitions
│   │   ├── outputs.tf        # Output values
│   │   ├── terraform.tfvars  # Environment-specific variables
│   │   └── backend.tf        # Backend configuration
│   │
│   ├── staging/              # Staging environment (same structure as dev)
│   └── prod/                 # Production environment (same structure as dev)
│
└── modules/                  # Reusable modules (if any)
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.5.0
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) configured with appropriate credentials
- Required AWS IAM permissions for the resources being created

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/terraform-aws-deployment.git
   cd terraform-aws-deployment
   ```

2. Navigate to the desired environment directory:
   ```bash
   cd environments/dev  # or staging/prod
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Review the execution plan:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Environment Configuration

### Development
- **Instance Type**: t3.micro
- **SSH Port**: 22 (default)
- **CIDR Blocks**: Open for testing (0.0.0.0/0)

### Staging
- **Instance Type**: t3.small
- **SSH Port**: Custom (2222)
- **CIDR Blocks**: Restricted to office IPs

### Production
- **Instance Type**: t3.medium
- **SSH Port**: Custom (22000)
- **CIDR Blocks**: Highly restricted
- **Backup**: Enabled
- **Monitoring**: CloudWatch logging and alarms

## Backend Configuration

Each environment uses an S3 backend for state management with the following structure:

```hcl
terraform {
  backend "s3" {
    bucket         = "terraform-projects-backend--6dptpbxe"
    key            = "environments/<env>/terraform.tfstate"
    region         = "af-south-1"
    encrypt        = true
    use_lockfile   = true
  }
}
```

## Security Considerations

- **SSH Access**:
  - Production uses a non-standard SSH port (22000)
  - SSH access is restricted to specific IP addresses
  - Automatic key pair generation with secure permissions (0400)

- **Network Security**:
  - Security groups follow the principle of least privilege
  - Production environment has restricted CIDR blocks
  - VPC flow logs enabled for monitoring

- **Secrets Management**:
  - Sensitive values are managed through variables
  - No hardcoded credentials in configuration files
  - Use AWS Secrets Manager or Parameter Store for production secrets

## Best Practices

1. **Version Control**:
   - Never commit `.tfstate` files
   - Use `.gitignore` to exclude sensitive files
   - Tag all resources for cost allocation

2. **State Management**:
   - Use remote state with locking
   - Regularly back up your state files
   - Use workspaces for environment isolation

3. **CI/CD Integration**:
   - Automate testing and deployment
   - Use remote execution for production environments
   - Implement approval gates for production changes

## Troubleshooting

### Common Issues

1. **Authentication Errors**
   - Verify AWS credentials are configured
   - Check IAM permissions
   - Ensure the correct AWS profile is being used

2. **State Locking Issues**
   ```bash
   terraform force-unlock <LOCK_ID>
   ```

3. **Module Not Found**
   ```bash
   terraform init -upgrade
   ```

## Contributing

1. Create a feature branch
2. Make your changes
3. Test your changes in a development environment
4. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Terraform AWS Modules](https://github.com/terraform-aws-modules)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
