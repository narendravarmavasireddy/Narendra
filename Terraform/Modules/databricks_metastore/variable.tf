variable "metastore_name" {
  description = "Name of the Databricks Unity Catalog metastore"
  type        = string
}

variable "storage_root" {
  description = "ADLS Gen2 path for Unity Catalog"
  type        = string
}

variable "location" {
  description = "Azure region for the metastore"
  type        = string
}

variable "owner" {
  description = "Owner group or user for the metastore"
  type        = string
}

variable "workspace_id" {
  description = "Databricks workspace ID to assign the metastore to"
  type        = string
}
