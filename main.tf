module "resource_group" {
  source                  = "./modules/resource_group"
  environment             = var.environment
  platform_name           = var.platform_name
  resource_group_location = var.resource_group_location
}

module "virtual_network" {
  source                        = "./modules/virtual_network"
  environment                   = var.environment
  platform_name                 = var.platform_name
  resource_group_name           = module.resource_group.rg_name
  resource_group_location       = var.resource_group_location
  virtual_network_location      = var.virtual_network_location
  virtual_network_address_space = var.virtual_network_address_space
  local_tags                    = var.local_tags
  depends_on                    = [module.resource_group]
}

module "subnets" {
  source               = "./modules/subnets"
  environment          = var.environment
  platform_name        = var.platform_name
  resource_group_name  = module.resource_group.rg_name
  virtual_network_name = module.virtual_network.virtual_network_name
  subnets              = var.subnets
  depends_on           = [module.virtual_network]
}

module "azure_firewall" {
  source                  = "./modules/azure_firewall"
  resource_group_name     = module.resource_group.rg_name
  resource_group_location = var.resource_group_location
  firewall_subnet_id      = module.subnets.subnet_ids[3]
  aks_subnet_id           = module.subnets.subnet_ids[2]
  aks_subnet_range        = var.aks_subnet_range
  management_subnet_range = var.management_subnet_range
  depends_on = [
    module.virtual_network,
    module.subnets
  ]
}

module "network_security_groups" {
  source                  = "./modules/network_security_groups"
  resource_group_name     = module.resource_group.rg_name
  nsg_location            = var.nsg_location
  network_security_groups = var.network_security_groups
  depends_on              = [module.resource_group]
}

module "nsg_associations" {
  source                    = "./modules/network_security_group_associations"
  for_each                  = { for mapping in var.subnet_nsg_mappings : mapping.subnet_name => mapping }
  subnet_id                 = module.subnets.subnetids[each.value.subnet_name]
  network_security_group_id = module.network_security_groups.nsg_ids[each.value.network_security_group_name]
  depends_on                = [module.network_security_groups]
}

module "user_assigned_managed_identity" {
  source              = "./modules/user_assigned_managed_identity"
  environment         = var.environment
  platform_name       = var.platform_name
  name                = "virtual_server"
  resource_group_name = module.resource_group.rg_name
  location            = var.resource_group_location
  depends_on          = [module.resource_group]
}

module "user_assigned_managed_identity_association" {
  source = "./modules/user_assigned_managed_identity_association"
  for_each = {
    "aks_cluster_user" : data.azurerm_role_definition.aks_cluster_user.id,
    "aks_cluster_admin" : data.azurerm_role_definition.aks_cluster_admin.id,
  }
  scope              = module.aks_clusters.cluster_ids[0]
  role_definition_id = each.value
  principal_id       = module.user_assigned_managed_identity.principal_id
  depends_on         = [module.user_assigned_managed_identity]
}


module "cluster_user_assigned_managed_identity" {
  source              = "./modules/user_assigned_managed_identity"
  environment         = var.environment
  platform_name       = var.platform_name
  name                = "aks_cluster"
  resource_group_name = module.resource_group.rg_name
  location            = var.resource_group_location
  depends_on          = [module.resource_group]
}

module "cluster_user_assigned_managed_identity_association" {
  source             = "./modules/user_assigned_managed_identity_association"
  scope              = module.aks_clusters.cluster_ids[0]
  role_definition_id = data.azurerm_role_definition.aks_network_contributor.id
  principal_id       = module.cluster_user_assigned_managed_identity.principal_id
  depends_on         = [module.cluster_user_assigned_managed_identity]
}


module "private_dns_zone" {
  source              = "./modules/private_dns"
  resource_group_name = module.resource_group.rg_name
  private_dns_name    = var.private_dns_name
  environment         = var.environment
  platform_name       = var.platform_name
  virtual_network_id  = module.virtual_network.virtual_network_id
  depends_on = [
    module.resource_group,
    module.virtual_network
  ]
}