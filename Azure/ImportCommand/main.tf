resource "azurerm_resource_group" "rg" {
  name     = "rg-import-demo"
  location = "eastus"
  tags = {
    environment = "demo"
  }
}

resource "azurerm_storage_account" "sa" {
  name                     = "stimportdemo17890"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  min_tls_version          = "TLS1_2"
  allow_nested_items_to_be_public = true
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-import-demo"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "snet-app"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}