data "azurerm_client_config" "current" {}
data "azurerm_storage_account" "backend" {
  name                = "amazonsa198"
  resource_group_name = "amazonsa"
}

data "aws_caller_identity" "current" {}
