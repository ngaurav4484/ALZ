variable "resource_group_location" {
  description = "The location of the resource group."
}

variable "platform_name" {
  description = "The name of the platform, used in interpolation for naming of resources"
}

variable "environment" {
  description = "The name of the environment the landing zone is being created for, used in interpolation for naming of resources"
}

variable "tfstateresourcegroup" {
  description = "The resource group for terraform tfstate"
}

variable "virtual_network_location" {
  description = "The Azure region where the virtual network should exist"
  type        = string
}

variable "virtual_network_address_space" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
}

variable "local_tags" {
  description = "A mapping of tags to assign to the resources"
  type        = map(string)
}

variable "subnets" {
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))
}


# variable "api_server_authorized_ip_ranges" {
#   description = "IP ranges allowed to interact with Kubernetes API. Leave empty to allow all."
#   type        = list(string)
#   default     = []
# }


## Azure Network Firewall
variable "firewall_subnet_id" {
  description = "The subnet ID for the Azure Firewall"
  default     = null

}

variable "aks_subnet_id" {
  description = "The subnet ID for the AKS Subnet"
  default     = null
}

variable "firewall_policy_name" {
  type        = string
  default     = "cloud-backbone-dev-fw-policy"
  description = "Name of the Azure Firewall policy"
}

variable "aks_subnet_range" {
  description = "The subnet range for the AKS Subnet"
  type        = list(string)
}

variable "management_subnet_range" {
  description = "The subnet range for the Management Subnet"
  type        = list(string)
}


## User Defined Route table association

variable "subnet_names" {
  type        = list(string)
  description = "The subnet names to be associated with udr table."
}

variable "nsg_location" {
  description = "The location of the nsg."
}

## Network Security Groups

variable "network_security_groups" {
  type = list(object({
    name                              = string
    rule_name                         = string
    rule_priority                     = number
    rule_direction                    = string
    rule_access                       = string
    rule_protocol                     = string
    rule_source_port_range            = string
    rule_destination_port_range       = string
    rule_source_address_prefixes      = list(string)
    rule_destination_address_prefixes = list(string)
  }))
}

## Network Security group association

variable "subnet_id" {
  type    = string
  default = null
}

variable "network_security_group_id" {
  type    = string
  default = null
}

variable "subnet_nsg_mappings" {
  type = list(object({
    subnet_name                 = string
    network_security_group_name = string
  }))
}


variable "name" {
  description = "The reference name for the managed identity"
  default     = null
}


variable "scope" {
  description = "ID of the virtual server"
  default     = null
}

variable "role_definition_id" {
  description = "ID of the cluster role"
  default     = null
}

variable "principal_id" {
  description = "ID of the managed identity"
  default     = null
}

variable "private_dns_name" {
  description = "The name of the private dns."
}

