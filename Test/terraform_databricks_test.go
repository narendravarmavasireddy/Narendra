package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestDatabricksWorkspace(t *testing.T) {
    t.Parallel()

    terraformOptions := &terraform.Options{
        TerraformDir: "../Terraform",
        VarsFiles: []string{
            "envs/Test/terraform.tfvars",
        },
        NoColor: true,
    }

    terraform.InitAndPlan(t, terraformOptions)

    workspaceId := terraform.Output(t, terraformOptions, "databricks_workspace_id")
    managedRg := terraform.Output(t, terraformOptions, "databricks_managed_rg_name")

    assert.NotEmpty(t, workspaceId)
    assert.Contains(t, managedRg, "mrg")
}
