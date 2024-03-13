output "subnet_names" {
  description = "List of subnet names"
  value       = [for subnet in var.subnets : subnet.name]
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = [for subnet in var.subnets : azurerm_subnet.subnet[subnet.name].id]
}

output "subnetids" {
  description = "Map of subnet names and IDs"
  value       = { for subnet in var.subnets : subnet.name => azurerm_subnet.subnet[subnet.name].id }
}