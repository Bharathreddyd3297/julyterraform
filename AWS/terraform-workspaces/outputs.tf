output "workspace" {
  value = terraform.workspace
}

output "env" {
  value = local.env
}

output "azure_vm_names" {
  value = module.azure.vm_names
}

output "azure_storage_account_names" {
  value = module.azure.storage_account_names
}

output "aws_vm_ids" {
  value = module.aws.vm_ids
}

output "aws_bucket_names" {
  value = module.aws.bucket_names
}

output "azure_subscription_id" {
  value = data.azurerm_client_config.current.subscription_id
}

output "azurerm_storage_account_backend_location" {
  value = data.azurerm_storage_account.backend.location
}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}


