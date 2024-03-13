# Terraform Azure Private DNS Module

This Terraform module enables you to manage Private DNS zones within Azure DNS.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Overview

The Azure Priavte DNS module automates the creation of private DNS in Azure, leveraging Terraform for infrastructure as code (IaC). It creates a private DNS zone and a network link between the private dns zone and the the virtual network(dns_association.tf).

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
| platform_name           | Name of the platform                                 | string                                   | -       | Yes      |
| environment             | Name of the environment                              | string                                   | -       | Yes      |
| resource_group_name     | Name of the Azure Resource Group                     | string                                   | -       | Yes      |
| private_dns_name        | Name of the Private DNS Zone                   | string                                   | -       | Yes      |
| virtual_network_id      | Id of the Virtual Network                            | string                                   | -       | Yes      |

## Outputs

The module provides the following outputs:

| Name        | Description                                 |
|-------------|---------------------------------------------|
| private_dns_zone_name | Name of the Private DNS Zone       |
| private_dns_zone_id   | ID of the Private DNS Zone        |

