package test

import (
    "testing"

    "github.com/gruntwork-io/terratest/modules/terraform"
)

func terraformOptions(t *testing.T) *terraform.Options {
    return &terraform.Options{
        TerraformDir: "../../Terraform/envs/Test",
        NoColor:      true,
    }
}
