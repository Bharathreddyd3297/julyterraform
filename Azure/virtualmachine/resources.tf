resource "azurerm_resource_group" "rg" {
  for_each = var.environments
  name = "rg-${each.key}"
  location = var.location
  lifecycle {
    prevent_destroy = true
    ignore_changes = [ tags ]
  }
}

resource "azurerm_virtual_network" "vnet" {
  for_each = var.environments
  name = "vnet-${each.key}"
  resource_group_name = azurerm_resource_group.rg[each.key].name
  address_space = [
    "10.${each.key == "dev" ? 1 : each.key == "qa" ? 2 : 3}.0.0/16"
  ]
  location = var.location
  depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_subnet" "subnet" {
  for_each = var.environments
  name = "subnet-${each.key}"
  resource_group_name = azurerm_resource_group.rg[each.key].name
  virtual_network_name = azurerm_virtual_network.vnet[each.key].name
  address_prefixes = [
    "10.${each.key == "dev" ? 1 : each.key == "qa" ? 2 : 3}.1.0/24"
  ]
  depends_on = [ azurerm_virtual_network.vnet ]
}

resource "azurerm_public_ip" "pip" {
  for_each = var.environments
  resource_group_name = azurerm_resource_group.rg[each.key].name
  location = var.location
  name = "pip-${each.key}"
  allocation_method = "Static"
  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_network_interface" "nic" {
  for_each = var.environments
  resource_group_name = azurerm_resource_group.rg[each.key].name
  location = var.location
  name = "nic-${each.key}"
  ip_configuration {
    name = "ipconfig-${each.key}"
    subnet_id = azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.environments
  resource_group_name = azurerm_resource_group.rg[each.key].name
  location = var.location
  name = "vm-${each.key}"
  size = each.value
  admin_username = var.admin_username
  admin_ssh_key {
    username = var.admin_username
    public_key = file(var.ssh_publickey_path)
  }
  disable_password_authentication = true
  source_image_reference {
  publisher = "Canonical"
  offer     = "ubuntu-24_04-lts" # Change to "ubuntu-24_04-lts" for current stable
  sku       = "server"
  version   = "latest"
}
network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
]
os_disk {
  name = "osdisk-${each.key}"
  caching = "ReadWrite"
  storage_account_type = "Standard_LRS"
}
lifecycle {
  ignore_changes = [ tags, size ]
}

}

resource "azurerm_resource_group" "countdemo" {
  count = 3
  # 0, 1, 2
  name = "count-rg-${count.index}"
  location = var.location

#   name = "count-rg-${count.index + 1}"
#   location = var.location
#   1,2,3 
}
