terraform {
  required_version = ">=1.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=5.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "eb2e4db4-1889-4351-9b48-102efd8a3a57"
}