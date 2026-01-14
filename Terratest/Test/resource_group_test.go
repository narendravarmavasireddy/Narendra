package test

import (
    "testing"

    "github.com/gruntwork-io/terratest/modules/azure"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestResourceGroup(t *testing.T) {
    t.Parallel()

    opts := terraformOptions(t)
    terraform.Init(t, opts)

    rgName := terraform.Output(t, opts, "resource_group_name")
    location := terraform.Output(t, opts, "location")

    // Azure existence validation (read-only)
    exists := azure.ResourceGroupExists(t, rgName, "")
    assert.True(t, exists)

    // Terraform configuration validation
    assert.NotEmpty(t, location)
}
