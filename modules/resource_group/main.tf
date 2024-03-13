resource "azurerm_resource_group" "rg" {
  name     = "${var.platform_name}-${var.environment}-rg"
  location = var.resource_group_location
}
