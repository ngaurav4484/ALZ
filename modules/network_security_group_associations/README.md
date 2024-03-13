# Terraform Network Security Group Association Module

This Terraform module is designed to associate Azure Network Security Groups (NSGs) with subnets within Azure. It provides a flexible and reusable way to manage the security posture of your Azure virtual networks by applying NSG rules to control inbound and outbound traffic.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)


## Overview

The Network Security Group Association module automates the association of NSGs with subnets in Azure, leveraging Terraform for infrastructure as code (IaC). It supports the creation of NSGs and their association with subnets, allowing for a secure and controlled network environment.

## Prerequisites

Before using this Terraform module, ensure you have the following prerequisites:

- Terraform installed (version 0.12 or later)
- Azure CLI installed and configured
- Azure subscription with sufficient permissions

## Usage

To use this Terraform module:

1. Clone this repository to your local machine.
2. Navigate to the directory containing your Terraform configuration files.
3. Update the `terraform.tfvars` file with your specific configurations (e.g., NSG names, subnet IDs, etc.).
4. Initialize Terraform by running `terraform init`.
5. Apply the Terraform configuration by running `terraform apply`.

## Inputs

The module accepts the following input variables:

| Name       | Description                           | Type   | Default | Required |
|------------|---------------------------------------|--------|---------|----------|
| nsg_name   | Name of the Network Security Group    | string | -       | Yes      |
| subnet_id  | Subnet ID to associate with the NSG   | string | -       | Yes      |

## Outputs

The module provides the following outputs:

| Name     | Description                       |
|----------|-----------------------------------|
| nsg_id   | ID of the Network Security Group  |

