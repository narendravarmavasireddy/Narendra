package test

import (
    "testing"

    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestNetwork(t *testing.T) {
    t.Parallel()

    opts := terraformOptions(t)
    terraform.Init(t, opts)

    vnetID := terraform.Output(t, opts, "vnet_id")
    privateSubnet := terraform.Output(t, opts, "private_subnet_name")

    assert.NotEmpty(t, vnetID)
    assert.NotEmpty(t, privateSubnet)
}
