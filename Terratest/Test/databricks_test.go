package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestDatabricks(t *testing.T) {
    t.Parallel()

    opts := terraformOptions(t)
    terraform.Init(t, opts)

    workspaceID := terraform.Output(t, opts, "databricks_workspace_id")
    managedRG := terraform.Output(t, opts, "databricks_managed_resource_group_name")

    assert.Contains(t, workspaceID, "Microsoft.Databricks")
    assert.NotEmpty(t, managedRG)
}
