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

variable "prefix" {
  description = "Naming prefix"
  type        = string
}

variable "private_endpoints" {
  description = "Private Endpoint definitions"
  type = map(object({
    subresource_names = list(string)
    dns_key           = string
  }))
}

variable "private_dns_zones" {
  description = "Private DNS zones to create"
  type        = map(string)
}

variable "metastore_name" {
  description = "Unity Catalog metastore name"
  type        = string
}

variable "metastore_storage_root" {
  description = "ADLS Gen2 root path for Unity Catalog"
  type        = string
}

variable "metastore_owner" {
  description = "Owner of the Unity Catalog metastore"
  type        = string
}

variable "region" {}

