# Terraform Azure Virtual Network Module

This Terraform module is designed to create and manage Azure Virtual Networks within Azure. It leverages Terraform for infrastructure as code (IaC), providing a flexible and reusable way to manage network configurations for Azure resources. This module supports the creation of Virtual Networks, which can be used to isolate network traffic and resources.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Overview

The Azure Virtual Network module automates the deployment of Virtual Networks in Azure. It allows for the creation of isolated networks for Azure resources, enhancing security and simplifying network management.

## Prerequisites

Before using this Terraform module, ensure you have the following prerequisites:

- Terraform installed (version 0.12 or later)
- Azure CLI installed and configured
- Azure subscription with sufficient permissions

## Usage

To use this Terraform module:

1. Clone this repository to your local machine.
2. Navigate to the directory containing your Terraform configuration files.
3. Update the `terraform.tfvars` file with your specific configurations (e.g., platform name, environment, resource group name, virtual network location, address space, etc.).
4. Initialize Terraform by running `terraform init`.
5. Apply the Terraform configuration by running `terraform apply`.

## Inputs

The module accepts the following input variables:

| Name                        | Description                                          | Type          | Default | Required |
|-----------------------------|------------------------------------------------------|---------------|---------|----------|
| platform_name               | Name of the platform                                 | string        | -       | Yes      |
| environment                 | Name of the environment                              | string        | -       | Yes      |
| resource_group_name         | Name of the Azure Resource Group                      | string        | -       | Yes      |
| virtual_network_location    | Location of the Virtual Network                      | string        | -       | Yes      |
| virtual_network_address_space | Address space of the Virtual Network               | list(string)  | -       | Yes      |
| local_tags                  | Local tags to be applied to resources                | map(string)   | {}      | No       |

## Outputs

The module provides the following outputs:

| Name                  | Description                                    |
|-----------------------|------------------------------------------------|
| virtual_network_id    | ID of the Virtual Network                      |

