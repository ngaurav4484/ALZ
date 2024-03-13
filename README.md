# Terraform Parent Module for Cloud Landing Zone [Development]

This Terraform parent module is designed to set up a cloud landing zone in Azure, leveraging Terraform for infrastructure as code (IaC). The module is structured into several sub-modules, each responsible for a specific aspect of the cloud environment setup. This modular approach allows for flexibility, reusability, and easier maintenance.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Modules](#modules)

## Overview

The Terraform parent module automates the deployment of a cloud landing zone in Azure. It includes the following components:

- **Resource Group:** Creates an Azure Resource Group.
- **Virtual Network:** Sets up a Virtual Network within the specified Resource Group.
- **Subnets:** Creates subnets within the Virtual Network.
- **Azure Firewall:** Deploys an Azure Firewall within the specified subnet.
- **User-Defined Routing Associations:** Associates subnets with User-Defined Routes.
- **Azure Bastion:** Deploys Azure Bastion for secure access to virtual machines.
- **Network Security Groups:** Creates Network Security Groups for enhanced network security.
- **Network Security Group Associations:** Associates Network Security Groups with subnets.
- **User Assigned Managed Identity:** Creates a User Assigned Managed Identity for Azure resources.
- **User Assigned Managed Identity Association:** Associates the User Assigned Managed Identity with Azure resources.
- **Virtual Server:** Deploys a virtual server within the specified subnet.
- **AKS Clusters:** Deploys Azure Kubernetes Service (AKS) clusters.
- **Private DNS Zone:** Creates a Private DNS zone and associates it with the virtual network.

Each component is encapsulated in its own Terraform module, allowing for independent management and updates.

## Prerequisites

Before using this Terraform module, ensure you have the following prerequisites:

- Terraform installed (version 0.12 or later)
- Azure CLI installed and configured
- Azure subscription with sufficient permissions

## Usage

To use this Terraform module:

1. Clone this repository to your local machine.
2. Navigate to the `environments/development` directory.
3. Update the `terraform.tfvars` file with your specific configurations (e.g., environment name, platform name, resource group location, etc.).
4. Initialize Terraform by running `terraform init`.
5. Apply the Terraform configuration by running `terraform apply`.

## Modules

### Resource Group

Creates an Azure Resource Group.

### Virtual Network

Sets up a Virtual Network within the specified Resource Group.

### Subnets

Creates subnets within the Virtual Network.

### Azure Firewall

Deploys an Azure Firewall within the specified subnet.

### User-Defined Routing Associations

Associates subnets with User-Defined Routes.

### Azure Bastion

Deploys Azure Bastion for secure access to virtual machines.

### Network Security Groups

Creates Network Security Groups for enhanced network security.

### Network Security Group Associations

Associates Network Security Groups with subnets.

### User Assigned Managed Identity

Creates a User Assigned Managed Identity for Azure resources.

### User Assigned Managed Identity Association

Associates the User Assigned Managed Identity with Azure resources.

### Virtual Server

Deploys a virtual server within the specified subnet.

### AKS Clusters

Deploys Azure Kubernetes Service (AKS) clusters.

### Private DNS Zone

Creates a Private DNS zone and associates it with the virtual network.


