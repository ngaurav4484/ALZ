output "firewall_name" {
  value       = azurerm_firewall.firewall.name
  description = "The name of the Azure Firewall"
}

output "firewall_public_ip" {
  value       = azurerm_public_ip.firewall_pip.ip_address
  description = "The public IP address of the Azure Firewall"
}

output "route_table_name" {
  value       = azurerm_route_table.rt.name
  description = "The name of the route table"
}

output "route_table_id" {
  value       = azurerm_route_table.rt.id
  description = "The id of the route table"
}
