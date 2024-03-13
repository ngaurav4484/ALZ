terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.89.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "core_hosting_01_arm_subscription_id"
  subscription_id = "89731d00-1ebf-435f-919e-45920d73b538"
  features {}
  skip_provider_registration = true
}
