variable "env" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "azure_vm_count" {
  type = number
}

variable "azure_vm_size" {
  type = string
}

variable "azure_admin_username" {
  type = string
}

variable "azure_admin_password" {
  type = string
}

variable "azure_storage_account_name_prefix" {
  type = string
}

variable "azure_storage_account_count" {
  type = number
}
