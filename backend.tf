terraform {
  backend "azurerm" {
    resource_group_name  = "backbone-resources"
    storage_account_name = "cloudbackbonedevtfstate"
    container_name       = "cloud-backbone-dev-tfstate"
    key                  = "terraform.tfstate"
  }
}