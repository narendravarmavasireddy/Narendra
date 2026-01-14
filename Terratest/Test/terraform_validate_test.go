package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformValidate(t *testing.T) {
    t.Parallel()

    opts := terraformOptions(t)
    terraform.Init(t, opts)
    terraform.Validate(t, opts)
}
