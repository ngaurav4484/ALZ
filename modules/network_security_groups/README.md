# Terraform Network Security Group Module

This Terraform module is designed to create and manage Azure Network Security Groups (NSGs) within Azure. It provides a flexible and reusable way to define and apply network security rules, allowing for a secure and controlled network environment.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Terraform Configuration](#TerraformConfiguration)
- [Inputs](#inputs)
- [Outputs](#outputs)


## Overview

The Network Security Group module automates the deployment of NSGs in Azure, leveraging Terraform for infrastructure as code (IaC). It supports the creation of NSGs and the definition of security rules, including inbound and outbound traffic rules, allowing for granular control over network traffic.

## Prerequisites

Before using this Terraform module, ensure you have the following prerequisites:

- Terraform installed (version 0.12 or later)
- Azure CLI installed and configured
- Azure subscription with sufficient permissions

## Usage

To use this Terraform module:

1. Clone this repository to your local machine.
2. Navigate to the directory containing your Terraform configuration files.
3. Update the `terraform.tfvars` file with your specific configurations (e.g., NSG names, resource group locations, etc.).
4. Initialize Terraform by running `terraform init`.
5. Apply the Terraform configuration by running `terraform apply`.



## Terraform Configuration

Below is the Terraform configuration snippet for creating an Azure Network Security Group with custom security rules:

```hcl
resource "azurerm_network_security_group" "nsg" {
  location            = var.nsg_location
  for_each            = { for nsg in var.network_security_groups : nsg.name => nsg }
  name                = each.value.name
  resource_group_name = var.resource_group_name

  security_rule {
    name                         = each.value.rule_name
    priority                     = each.value.rule_priority
    direction                    = each.value.rule_direction
    access                       = each.value.rule_access
    protocol                     = each.value.rule_protocol
    source_port_range            = each.value.rule_source_port_range
    destination_port_range       = each.value.rule_destination_port_range
    source_address_prefixes      = each.value.rule_source_address_prefixes
    destination_address_prefixes = each.value.rule_destination_address_prefixes
  }
}
```

## Inputs

The module accepts the following input variables:
| Name                       | Description                                           | Type               | Default | Required |
|----------------------------|-------------------------------------------------------|--------------------|---------|----------|
| resource_group_name        | The name of the resource group to contain the NSG.    | string             |         | Yes      |
| nsg_location               | The Azure region where the NSG will be created.       | string             |         | Yes      |
| network_security_groups    | List of network security groups configurations.      | list(obj)          |         | Yes      |
|                            |                                                       |                    |         |          |
| network_security_groups.name                             | Name of the Network Security Group.                                 | string   |         | Yes      |
| network_security_groups.rule_name                        | Name of the security rule.                                          | string   |         | Yes      |
| network_security_groups.rule_priority                    | Priority of the security rule.                                      | number   |         | Yes      |
| network_security_groups.rule_direction                   | Direction of the security rule (`Inbound` or `Outbound`).           | string   |         | Yes      |
| network_security_groups.rule_access                      | Access of the security rule (`Allow` or `Deny`).                     | string   |         | Yes      |
| network_security_groups.rule_protocol                    | Protocol of the security rule.                                      | string   |         | Yes      |
| network_security_groups.rule_source_port_range           | Port range for the source IP address.                              | string   |         | Yes      |
| network_security_groups.rule_destination_port_range      | Port range for the destination IP address.                         | string   |         | Yes      |
| network_security_groups.rule_source_address_prefixes     | List of source IP address prefixes in CIDR notation.                | list     |         | Yes      |
| network_security_groups.rule_destination_address_prefixes| List of destination IP address prefixes in CIDR notation.           | list     |         | Yes      |

## Outputs

The module provides the following outputs:

| Name   | Description                         |
|--------|-------------------------------------|
| nsg_id | ID of the Network Security Group    |

