package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestPrivateDNS(t *testing.T) {
    t.Parallel()

    opts := terraformOptions(t)
    terraform.Init(t, opts)

    dnsZones := terraform.OutputMap(t, opts, "private_dns_zone_ids")
    assert.NotEmpty(t, dnsZones)
}
