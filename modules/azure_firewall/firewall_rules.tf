# Firewall Rules for AKS subnet

resource "azurerm_firewall_policy_rule_collection_group" "aks_rule_collection_group" {
  name               = "aksRuleCollectionGroup"
  firewall_policy_id = azurerm_firewall_policy.firewall_policy.id
  priority           = 100

  application_rule_collection {
    name     = "aksApplicationRules"
    priority = 300
    action   = "Allow"
    rule {
      name             = "AllowAKSOutboundFQDNs"
      source_addresses = var.aks_subnet_range
      destination_fqdns = [
        "*.hcp.azure.com",
        "*.tun.azure.com",
        "*.blob.core.windows.net",
        "*.azurecr.io",
        "login.microsoftonline.com",
        "packages.microsoft.com",
        "acs-mirror.azureedge.net",
        // Add other required FQDNs here
      ]
      protocols {
        type = "Http"
        port = 80
      }
      protocols {
        type = "Https"
        port = 443
      }
    }
  }

  network_rule_collection {
    name     = "aksNetworkRules"
    priority = 200
    action   = "Allow"
    rule {
      name                  = "AllowAKSOutboundNetworkRules"
      source_addresses      = var.aks_subnet_range
      destination_ports     = ["22", "443", "9000"] // Add other required ports here
      destination_addresses = ["*"]
      protocols             = ["TCP", "UDP"]
    }
  }
}


# Firewall Rule Collection for Management Subnet

resource "azurerm_firewall_policy_rule_collection_group" "management_rules" {
  name               = "managementRuleCollectionGroup"
  firewall_policy_id = azurerm_firewall_policy.firewall_policy.id
  priority           = 100
  network_rule_collection {
    name     = "managementNetworkRules"
    priority = 200
    action   = "Allow"
    rule {
      name                  = "AllowManagementSubnetAllOutboundTraffic"
      source_addresses      = var.management_subnet_range
      destination_ports     = ["*"]   # Allows ANY TCP or UDP Port
      destination_addresses = ["*"]   # Matches Any IP Address
      protocols             = ["Any"] # Includes both TCP & UDP Protocols
    }
  }
}
