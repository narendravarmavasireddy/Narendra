variable "location" {}
variable "rg_name" {}
variable "databricks_rg_name" {}
variable "databricks_name" {}
variable "vnet_name" {}
variable "public_subnet_name" {}
variable "private_subnet_name" {}
variable "storage_subnet" {
  
}
variable "NSG" {}

variable "storage_account_name" {
    type = string
}
variable "key_vault_name" {}
