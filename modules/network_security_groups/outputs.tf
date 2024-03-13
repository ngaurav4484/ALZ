output "nsg_ids" {
  description = "Map of network security group names and IDs"
  value       = { for nsg in var.network_security_groups : nsg.name => azurerm_network_security_group.nsg[nsg.name].id }
}

output "nsg_id" {
  value = [for nsg in var.network_security_groups : azurerm_network_security_group.nsg[nsg.name].id]
}

output "nsg_names" {
  description = "List of network security group names"
  value       = [for nsg in var.network_security_groups : nsg.name]
}