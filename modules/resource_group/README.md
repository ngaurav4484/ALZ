# Terraform Azure Resource Group Module

This Terraform module is designed to create and manage Azure Resource Groups within Azure. It provides a flexible and reusable way to organize and manage resources, allowing for efficient resource management and deployment.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Terraform Configuration](#TerraformConfiguration)
- [Inputs](#inputs)
- [Outputs](#outputs)


## Overview

The Azure Resource Group module automates the deployment of resource groups in Azure, leveraging Terraform for infrastructure as code (IaC). It supports the creation of resource groups, which are logical containers for resources deployed on Azure.

## Prerequisites

Before using this Terraform module, ensure you have the following prerequisites:

- Terraform installed (version 0.12 or later)
- Azure CLI installed and configured
- Azure subscription with sufficient permissions

## Usage

To use this Terraform module:

1. Clone this repository to your local machine.
2. Navigate to the directory containing your Terraform configuration files.
3. Update the `terraform.tfvars` file with your specific configurations (e.g., resource group names, locations, etc.).
4. Initialize Terraform by running `terraform init`.
5. Apply the Terraform configuration by running `terraform apply`.


## Terraform Configuration

```hcl
module "rg" {
  source                   = "path/to/module"
  platform_name            = var.platform_name
  environment              = var.environment
  resource_group_location  = var.resource_group_location
}
```

## Inputs

The module accepts the following input variables:

| Name               | Description                           | Type   | Default | Required |
|--------------------|---------------------------------------|--------|---------|----------|
| resource_group_name| Name of the Azure Resource Group      | string | -       | Yes      |
| location           | Location of the resource group        | string | -       | Yes      |

## Outputs

The module provides the following outputs:

| Name               | Description                         |
|--------------------|-------------------------------------|
| resource_group_id  | ID of the Azure Resource Group     |



