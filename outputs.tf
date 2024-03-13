# Resource Group Output

output "dev_rg_name" {
  value = module.resource_group.rg_name
}

# Subnets Output

output "dev_subnet_names" {
  value = module.subnets.subnet_names
}

output "dev_subnet_ids" {
  value = module.subnets.subnet_ids
}

# Virtual Network Output

output "dev_virtual_network_id" {
  value = module.virtual_network.virtual_network_id
}

output "dev_virtual_network_name" {
  value = module.virtual_network.virtual_network_name
}

# Firewall Module Output

output "dev_firewall_name" {
  description = "The ID of the Azure Firewall"
  value       = module.azure_firewall.firewall_name
}

output "dev_firewall_public_ip" {
  description = "The public IP address of the Azure Firewall"
  value       = module.azure_firewall.firewall_public_ip
}

# User Defined Route Table Output

output "dev_route_table_name" {
  description = "The name of the route table"
  value       = module.azure_firewall.route_table_name
}

output "dev_route_table_id" {
  description = "The id of the route table"
  value       = module.azure_firewall.route_table_id
}



#Network Security Group Output

output "dev_network_security_group_ids" {
  description = "The ID's of the Network security groups"
  value       = module.network_security_groups.nsg_id
}


# User Managed Identity Output

output "dev_managed_identity_id_virtual_server" {
  description = "ID of the managed identity"
  value       = module.user_assigned_managed_identity.id
}

output "dev_managed_identity_id_aks_cluster" {
  description = "ID of the managed identity"
  value       = module.cluster_user_assigned_managed_identity.id
}


# Private DNS Zone Output

output "dev_private_dns_zone_name" {
  description = "The name of the Private DNS Zone"
  value       = module.private_dns_zone.private_dns_zone_name
}

output "dev_private_dns_zone_id" {
  description = "The ID of the Private DNS Zone"
  value       = module.private_dns_zone.private_dns_zone_id
}
