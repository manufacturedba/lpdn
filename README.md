# lpdn
low-powered delivery network

# Steps to run the project

## 1. Install Terraform with Azure CLI

https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build

```bash
export ARM_SUBSCRIPTION_ID="<your-subscription-id>"
export ARM_TENANT_ID="<your-tenant-id>"
```

## 2. Deploy container to resource group

```bash
terraform init
terraform apply
```