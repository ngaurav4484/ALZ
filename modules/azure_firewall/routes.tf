resource "azurerm_route_table" "rt" {
  name                = "${var.firewall_name}-rt"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_route" "route_to_firewall" {
  name                   = "route-to-firewall"
  resource_group_name    = var.resource_group_name
  route_table_name       = azurerm_route_table.rt.name
  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
}
