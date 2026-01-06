resource "databricks_metastore" "this" {
  name         = var.metastore_name
  storage_root = var.storage_root
  region       = var.region
  owner        = var.owner

  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_metastore_assignment" "this" {
  metastore_id = databricks_metastore.this.id
  workspace_id = var.workspace_id
}
