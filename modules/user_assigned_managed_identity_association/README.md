# Terraform Azure Role Assignment Module

This Terraform module is designed to create and manage Azure Role Assignments within Azure. It leverages Terraform for infrastructure as code (IaC), providing a flexible and reusable way to manage access control and permissions for Azure resources. This module supports the creation of Role Assignments, which can be used to grant specific permissions to users, groups, or service principals.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)


## Overview

The Azure Role Assignment module automates the deployment of Role Assignments in Azure. It allows for the creation of assignments that grant permissions to manage Azure Kubernetes Service (AKS) clusters, enhancing security and simplifying access management.

## Prerequisites

Before using this Terraform module, ensure you have the following prerequisites:

- Terraform installed (version 0.12 or later)
- Azure CLI installed and configured
- Azure subscription with sufficient permissions

## Usage

To use this Terraform module:

1. Clone this repository to your local machine.
2. Navigate to the directory containing your Terraform configuration files.
3. Update the `terraform.tfvars` file with your specific configurations (e.g., scope, role definition ID, principal ID, etc.).
4. Initialize Terraform by running `terraform init`.
5. Apply the Terraform configuration by running `terraform apply`.

## Inputs

The module accepts the following input variables:

| Name                 | Description                                                  | Type   | Default | Required |
|----------------------|--------------------------------------------------------------|--------|---------|----------|
| scope                | The scope at which the Role Assignment should be applied     | string | -       | Yes      |
| role_definition_id   | The ID of the Role Definition to assign                       | string | -       | Yes      |
| principal_id         | The ID of the Principal (User, Group, Service Principal, or Managed Identity) to assign the role to | string | - | Yes |

## Outputs

The module provides the following outputs:

| Name                | Description                          |
|---------------------|--------------------------------------|
| role_assignment_id  | ID of the Role Assignment            |

