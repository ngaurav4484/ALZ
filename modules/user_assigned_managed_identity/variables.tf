variable "platform_name" {
  description = "The name of the platform, used in interpolation for naming of resources"
}

variable "environment" {
  description = "The name of the environment the landing zone is being created for, used in interpolation for naming of resources"
}

variable "name" {
  description = "The reference name for the managed identity"
}

variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Location of the subnet"
}