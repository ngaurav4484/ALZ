resource "azurerm_virtual_network" "vnet" {
  name                = "${var.platform_name}-${var.environment}-vnet"
  resource_group_name = var.resource_group_name
  location            = var.virtual_network_location
  address_space       = var.virtual_network_address_space
  tags                = var.local_tags
}
