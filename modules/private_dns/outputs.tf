output "private_dns_zone_name" {
  description = "The name of the private dns zone"
  value       = azurerm_private_dns_zone.private_dns_zone.name
}

output "private_dns_zone_id" {
  description = "The ID of the private dns zone"
  value       = azurerm_private_dns_zone.private_dns_zone.id
}