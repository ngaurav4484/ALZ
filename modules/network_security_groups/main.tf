resource "azurerm_network_security_group" "nsg" {
  location            = var.nsg_location
  for_each            = { for nsg in var.network_security_groups : nsg.name => nsg }
  name                = each.value.name
  resource_group_name = var.resource_group_name
  security_rule {
    name                         = each.value.rule_name
    priority                     = each.value.rule_priority
    direction                    = each.value.rule_direction
    access                       = each.value.rule_access
    protocol                     = each.value.rule_protocol
    source_port_range            = each.value.rule_source_port_range
    destination_port_range       = each.value.rule_destination_port_range
    source_address_prefixes      = each.value.rule_source_address_prefixes
    destination_address_prefixes = each.value.rule_destination_address_prefixes
  }
}