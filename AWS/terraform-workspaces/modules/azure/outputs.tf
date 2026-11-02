output "vm_names" {
  value = azurerm_linux_virtual_machine.vm[*].name
}

output "storage_account_names" {
  value = azurerm_storage_account.sa[*].name
}