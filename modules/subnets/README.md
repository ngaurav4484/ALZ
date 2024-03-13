# Terraform Azure Subnet Module

This Terraform module is designed to create and manage Azure Virtual Network Subnets within Azure. It leverages Terraform for infrastructure as code (IaC), providing a flexible and reusable way to organize and manage network segments. This module supports the creation of multiple subnets within a single virtual network, allowing for efficient network configuration and resource deployment.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Overview

The Azure Subnet module automates the deployment of subnets in Azure Virtual Networks. It uses a for_each loop to iterate over a list of subnet configurations, creating a subnet for each entry. This approach allows for the creation of multiple subnets with different configurations within the same virtual network.

## Prerequisites

Before using this Terraform module, ensure you have the following prerequisites:

- Terraform installed (version 0.12 or later)
- Azure CLI installed and configured
- Azure subscription with sufficient permissions

## Usage

To use this Terraform module:

1. Clone this repository to your local machine.
2. Navigate to the directory containing your Terraform configuration files.
3. Update the `terraform.tfvars` file with your specific configurations (e.g., subnet names, virtual network names, address prefixes, etc.).
4. Initialize Terraform by running `terraform init`.
5. Apply the Terraform configuration by running `terraform apply`.

## Inputs

The module accepts the following input variables:

| Name                    | Description                                          | Type                                     | Default | Required |
|-------------------------|------------------------------------------------------|------------------------------------------|---------|----------|
| subnets                 | List of subnet configurations                        | list(object({ name = string, address_prefixes = list(string) })) | -       | Yes      |
| resource_group_name     | Name of the Azure Resource Group                     | string                                   | -       | Yes      |
| virtual_network_name    | Name of the Azure Virtual Network                    | string                                   | -       | Yes      |

## Outputs

The module provides the following outputs:

| Name        | Description                                 |
|-------------|---------------------------------------------|
| subnet_ids  | Map of subnet IDs keyed by subnet name      |

