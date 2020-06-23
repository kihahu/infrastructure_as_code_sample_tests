// +build terraform gcp

package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestGcpSpanner(t *testing.T) {
	// Run the test in parallel
	t.Parallel()
	// Generate a unique name for the resource to avoid name colisson
	displayName := fmt.Sprintf("test-spanner-%s", random.UniqueId())
	databaseName := "test-database"
	/* Pass options to terraform e.g directory for terraform code
	Input variables that the module / resource expects
	Environment variables the module / resource uses
	*/
	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/gcp/spanner",
		Vars: map[string]interface{}{
			"display_name":  displayName,
			"database_name": databaseName,
		},
		NoColor: false,
	}
	// Terraform destroy always runs
	defer terraform.Destroy(t, terraformOptions)
	// Terraform apply to create resources
	terraform.InitAndApply(t, terraformOptions)
}
