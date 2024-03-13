resource "azurerm_public_ip" "firewall_pip" {
  name                = "${var.firewall_name}-pip"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall_policy" "firewall_policy" {
  name                = var.firewall_policy_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = "Premium" # Ensure the SKU is set to Premium

  threat_intelligence_mode = "Deny"
  intrusion_detection {
    mode = "Deny"
  }
}

resource "azurerm_firewall" "firewall" {
  name                = var.firewall_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Premium" # Ensure the SKU tier is set to Premium
  firewall_policy_id  = azurerm_firewall_policy.firewall_policy.id
  threat_intel_mode   = "Deny"
  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.firewall_subnet_id
    public_ip_address_id = azurerm_public_ip.firewall_pip.id
  }
}
