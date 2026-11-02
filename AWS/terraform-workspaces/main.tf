module "azure" {
  source                            = "./modules/azure"
  env                               = local.env
  resource_group_name               = "${var.resource_group_name}-${local.env}"
  location                          = var.location
  azure_vm_count                    = var.azure_vm_count
  azure_vm_size                     = var.azure_vm_size
  azure_admin_username              = var.azure_admin_username
  azure_admin_password              = var.azure_admin_password
  azure_storage_account_name_prefix = var.azure_storage_account_name_prefix
  azure_storage_account_count       = var.azure_storage_account_count
}

module "aws" {
  source            = "./modules/aws"
  aws_vm_count      = var.aws_vm_count
  aws_ami_id        = var.aws_ami_id
  aws_instance_type = var.aws_instance_type
  aws_bucket_count  = var.aws_bucket_count
  aws_bucket_prefix = var.aws_bucket_prefix
  aws_region        = var.aws_region
}