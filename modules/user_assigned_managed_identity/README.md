# Terraform Azure User Assigned Managed Identity Module

This Terraform module is designed to create and manage Azure User Assigned Managed Identities within Azure. It leverages Terraform for infrastructure as code (IaC), providing a flexible and reusable way to manage identities for Azure resources. This module supports the creation of User Assigned Managed Identities, which can be used to authenticate and authorize access to Azure resources.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)
## Overview

The Azure User Assigned Managed Identity module automates the deployment of User Assigned Managed Identities in Azure. It allows for the creation of identities that can be used to authenticate and authorize access to Azure resources, enhancing security and simplifying access management.

## Prerequisites

Before using this Terraform module, ensure you have the following prerequisites:

- Terraform installed (version 0.12 or later)
- Azure CLI installed and configured
- Azure subscription with sufficient permissions

## Usage

To use this Terraform module:

1. Clone this repository to your local machine.
2. Navigate to the directory containing your Terraform configuration files.
3. Update the `terraform.tfvars` file with your specific configurations (e.g., platform name, environment, resource group name, location, etc.).
4. Initialize Terraform by running `terraform init`.
5. Apply the Terraform configuration by running `terraform apply`.

## Inputs

The module accepts the following input variables:

| Name                 | Description                                     | Type    | Default | Required |
|----------------------|-------------------------------------------------|---------|---------|----------|
| platform_name        | Name of the platform                            | string  | -       | Yes      |
| environment          | Name of the environment                         | string  | -       | Yes      |
| resource_group_name  | Name of the Azure Resource Group                | string  | -       | Yes      |
| location             | Location of the resource group                   | string  | -       | Yes      |

## Outputs

The module provides the following outputs:

| Name                            | Description                                      |
|---------------------------------|--------------------------------------------------|
| managed_identity_id             | ID of the User Assigned Managed Identity          |
| managed_identity_client_id      | Client ID of the User Assigned Managed Identity  |
| managed_identity_principal_id   | Principal ID of the User Assigned Managed Identity |

