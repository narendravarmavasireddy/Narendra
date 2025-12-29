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
  description = "Private Endpoint configuration map"
  type = map(object({
    resource_id        = string
    subresource_names  = list(string)
    dns_key            = string
  }))
}

variable "private_dns_zones" {
  description = "Private DNS zones to create"
  type        = map(string)
}
