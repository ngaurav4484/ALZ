variable "platform_name" {
  description = "The name of the platform, used in interpolation for naming of resources"
}

variable "environment" {
  description = "The name of the environment the landing zone is being created for, used in interpolation for naming of resources"
}

variable "resource_group_location" {
  description = "The location of the resource group."
}

variable "resource_group_name" {
  description = "The name of the resource group."
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
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
}
