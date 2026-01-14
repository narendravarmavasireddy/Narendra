package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestKeyVault(t *testing.T) {
    t.Parallel()

    opts := terraformOptions(t)
    terraform.Init(t, opts)

    kvURI := terraform.Output(t, opts, "key_vault_uri")
    kvID := terraform.Output(t, opts, "key_vault_id")

    assert.Contains(t, kvURI, "vault.azure.net")
    assert.Contains(t, kvID, "/providers/Microsoft.KeyVault/")
}
