terraform {
  backend "azurerm" {
    resource_group_name  = "amazonsa"
    storage_account_name = "amazonsa198"
    container_name       = "growstate"
    key                  = "workspaces/terraform.tfstate"
  }
}