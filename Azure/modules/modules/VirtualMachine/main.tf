resource "azurerm_virtual_network" "vnet" {
  name = "${var.vm_name}-vnet"
  address_space = ["10.0.0.0/16"]
  location = var.location
  resource_group_name = var.rgname
}

resource "azurerm_subnet" "subnet" {
  name = "${var.vm_name}-subnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = var.rgname
  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "pip" {
  name = "${var.vm_name}-pip"
  location = var.location
  resource_group_name = var.rgname 
  allocation_method = "Static"
}

resource "azurerm_network_interface" "nic" {
  name = "${var.vm_name}-nic"
  location = var.location
  resource_group_name = var.rgname
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name = var.vm_name
  location = var.location
  resource_group_name = var.rgname
  admin_username = var.admin_username
  admin_password = var.admin_password
  size = "Standard_B2s"
  network_interface_ids = [ azurerm_network_interface.nic.id ]
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}