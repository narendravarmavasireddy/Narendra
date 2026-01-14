package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestStorage(t *testing.T) {
    t.Parallel()

    opts := terraformOptions(t)
    terraform.Init(t, opts)

    storageID := terraform.Output(t, opts, "storage_account_id")
    assert.Contains(t, storageID, "Microsoft.Storage")
}
