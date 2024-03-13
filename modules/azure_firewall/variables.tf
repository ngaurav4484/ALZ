variable "firewall_name" {
  type        = string
  default     = "cloud-backbone-dev-fw"
  description = "Name of the Azure Firewall"
}

variable "firewall_policy_name" {
  type        = string
  default     = "cloud-backbone-dev-fw-policy"
  description = "Name of the Azure Firewall policy"
}

variable "resource_group_location" {
  description = "The location of the resource group."
}

variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "firewall_subnet_id" {
  description = "The subnet ID for the Azure Firewall"
}

variable "aks_subnet_id" {
  description = "The subnet ID for the AKS Subnet"
}

variable "aks_subnet_range" {
  description = "The subnet range for the AKS Subnet"
  type        = list(string)
}

variable "management_subnet_range" {
  description = "The subnet range for the Management Subnet"
  type        = list(string)
}
