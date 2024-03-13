# Azure Firewall Terraform Module

This Terraform module is designed to deploy and manage Azure Firewall instances within Azure. It provides a flexible and reusable way to create and configure Azure Firewalls, including public IP addresses, firewall policies, and network rules.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Firewall Rules](#firewall-rules)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Overview

The Azure Firewall module automates the deployment of Azure Firewalls in Azure, leveraging Terraform for infrastructure as code (IaC). It supports the creation of public IP addresses, firewall policies, and network rules, allowing for a secure and controlled network environment.

## Prerequisites

Before using this Terraform module, ensure you have the following prerequisites:

- Terraform installed (version 0.12 or later)
- Azure CLI installed and configured
- Azure subscription with sufficient permissions

## Usage

To use this Terraform module:

1. Clone this repository to your local machine.
2. Navigate to the directory containing your Terraform configuration files.
3. Update the `terraform.tfvars` file with your specific configurations (e.g., firewall names, resource group locations, etc.).
4. Initialize Terraform by running `terraform init`.
5. Apply the Terraform configuration by running `terraform apply`.

## Firewall Rules

The module supports the configuration of both application and network rules for the Azure Firewall. These rules can be defined to allow or deny traffic based on specific criteria such as source and destination IP addresses, ports, and protocols.

### Application Rules

Application rules allow you to define rules based on FQDNs (Fully Qualified Domain Names) and protocols (HTTP/HTTPS). These rules are useful for controlling access to external resources over the internet.

### Network Rules

Network rules allow you to define rules based on source and destination IP addresses and ports. These rules are useful for controlling access to specific services or resources within your network.

## Inputs

The module accepts the following input variables:

| Name                    | Description                               | Type    | Default | Required |
|-------------------------|-------------------------------------------|---------|---------|----------|
| firewall_name           | Name of the Azure Firewall                | string  | -       | Yes      |
| resource_group_name     | Name of the resource group                | string  | -       | Yes      |
| resource_group_location | Location of the resource group            | string  | -       | Yes      |
| firewall_subnet_id      | Subnet ID for the Azure Firewall          | string  | -       | Yes      |
| firewall_policy_name    | Name of the Azure Firewall Policy         | string  | -       | Yes      |

## Outputs

The module provides the following outputs:

| Name               | Description                               |
|--------------------|-------------------------------------------|
| firewall_id        | ID of the Azure Firewall                   |
| firewall_public_ip | Public IP address of the Azure Firewall   |
