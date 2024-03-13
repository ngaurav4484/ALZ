variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "nsg_location" {
  description = "The location of the nsg."
}

variable "network_security_groups" {
  type = list(object({
    name                              = string
    rule_name                         = string
    rule_priority                     = number
    rule_direction                    = string
    rule_access                       = string
    rule_protocol                     = string
    rule_source_port_range            = string
    rule_destination_port_range       = string
    rule_source_address_prefixes      = list(string)
    rule_destination_address_prefixes = list(string)
  }))
}