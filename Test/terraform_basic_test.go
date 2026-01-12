package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestTerraformBasic(t *testing.T) {
    t.Parallel()

    terraformOptions := &terraform.Options{
        TerraformDir: "../Terraform",

        VarsFiles: []string{
            "envs/Test/terraform.tfvars",
        },

        NoColor: true,
    }

    // Only init & plan (safe for CI)
    terraform.InitAndPlan(t, terraformOptions)

    // Read critical outputs
    rgName := terraform.Output(t, terraformOptions, "resource_group_name")
    location := terraform.Output(t, terraformOptions, "location")

    assert.NotEmpty(t, rgName)
    assert.NotEmpty(t, location)
}
