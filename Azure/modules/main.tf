module "resource_group" {
  source = "./modules/ResourceGroup"
  rgname = var.rgname
  location = var.location
}

module "storage_account" {
  source = "./modules/Storage Account"
  rgname = module.resource_group.rgname
  location = var.location
  storage_account_name = var.storage_account_name
}

module "virtual_machine" {
  source = "./modules/VirtualMachine"
  rgname = module.resource_group.rgname
  location = var.location
  admin_password = var.admin_password
  admin_username = var.admin_username
  vm_name = var.vm_name
}