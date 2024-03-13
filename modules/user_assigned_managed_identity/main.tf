resource "azurerm_user_assigned_identity" "managed_identity" {
  name                = "${var.platform_name}-${var.environment}-managed-identity-${var.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
}
