variable "platform_name" {
  description = "The name of the platform, used in interpolation for naming of resources"
}

variable "environment" {
  description = "The name of the environment the landing zone is being created for, used in interpolation for naming of resources"
}

variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "private_dns_name" {
  description = "The name of the private dns."
}

variable "virtual_network_id" {
  description = "The id of the virtual network."
}