variable "platform_name" {
  description = "The name of the platform, used in interpolation for naming of resources"
}

variable "environment" {
  description = "The name of the environment the landing zone is being created for, used in interpolation for naming of resources"
}

variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
}

variable "subnets" {
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))
}