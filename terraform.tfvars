# terraform.tfvars in the parent module

resource_group_location = "West Europe"
platform_name           = "cloud-backbone"
environment             = "dev"
tfstateresourcegroup    = "backbone-resources"

#variables for virtual network
virtual_network_location      = "West Europe"
virtual_network_address_space = ["172.16.0.0/12"]
local_tags = {
  environment = "development"
  project     = "landing_zone"
}

#variales for subnets
subnets = [
  {
    name             = "AzureBastionSubnet",
    address_prefixes = ["172.16.0.0/26"]
  },
  {
    name             = "cloud-backbone-dev-management-subnet",
    address_prefixes = ["172.16.0.64/28"]
  },
  {
    name             = "cloud-backbone-dev-aks-subnet",
    address_prefixes = ["172.16.64.0/18"]
  },
  {
    name             = "AzureFirewallSubnet",
    address_prefixes = ["172.16.144.0/26"]
  },
  {
    name             = "cloud-backbone-dev-load-balancer",
    address_prefixes = ["172.16.144.64/27"]
  }
]

#variables for azure firewall
aks_subnet_range        = ["172.16.64.0/18"]
management_subnet_range = ["172.16.0.64/28"]

#variables for user defined routing associations
subnet_names = ["cloud-backbone-dev-management-subnet", "cloud-backbone-dev-aks-subnet"]

#variables for network security groups
nsg_location = "West Europe"
network_security_groups = [
  {
    name                              = "nsg_management_subnet",
    rule_name                         = "nsg_management_subnet_rule",
    rule_priority                     = 100,
    rule_direction                    = "Inbound",
    rule_access                       = "Allow",
    rule_protocol                     = "Tcp",
    rule_source_port_range            = "*",
    rule_destination_port_range       = "22",
    rule_source_address_prefixes      = ["172.16.0.0/26"],
    rule_destination_address_prefixes = ["172.16.0.64/28"]
  },
  {
    name                              = "nsg_aks_subnet",
    rule_name                         = "nsg_aks_subnet_rule",
    rule_priority                     = 100,
    rule_direction                    = "Inbound",
    rule_access                       = "Allow",
    rule_protocol                     = "Tcp",
    rule_source_port_range            = "*",
    rule_destination_port_range       = "22",
    rule_source_address_prefixes      = ["172.16.0.64/28"],
    rule_destination_address_prefixes = ["172.16.64.0/18"]
  }
]

#variables for network security group associations
subnet_nsg_mappings = [
  {
    subnet_name                 = "cloud-backbone-dev-management-subnet"
    network_security_group_name = "nsg_management_subnet"
  },
  {
    subnet_name                 = "cloud-backbone-dev-aks-subnet"
    network_security_group_name = "nsg_aks_subnet"
  }
]


#variables for private dns zone
private_dns_name = "cloudlandingzone.maerskdev.net"
