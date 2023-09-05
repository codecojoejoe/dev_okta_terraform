# ------------------------------------------------------------------------------------------
# Okta sandbox

resource "tfe_workspace" "dev_okta_terraform" {
  name               = "dev-okta-terraform"
  organization       = var.org_name
  description        = "Workspace to build the Included Dev Okta org via infrastructure-as-code"
  allow_destroy_plan = false
  terraform_version  = "1.5.6"
}
