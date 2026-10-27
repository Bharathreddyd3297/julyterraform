resource "azurerm_storage_account" "sa" {
  name = var.storage_account_name
  resource_group_name = var.rgname
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}