resource "azurerm_storage_account" "SAB1" {
  name                     = "amexsa1990"
  resource_group_name      = azurerm_resource_group.RGB1.name
  location                 = azurerm_resource_group.RGB1.location
  account_replication_type = "LRS"
  account_tier             = "Standard"
}