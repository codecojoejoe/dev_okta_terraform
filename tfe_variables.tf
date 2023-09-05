# ------------------------------------------------------------------------------------------
# Okta sandbox

resource "tfe_variable" "dev_okta_terraform_org_name" {
  category     = "terraform"
  description  = "Okta org sub-domain"
  workspace_id = tfe_workspace.dev_okta_terraform.id
  hcl          = false
  sensitive    = false
  key          = "org_name"
  value        = "included-dev"
}

resource "tfe_variable" "dev_okta_terraform_base_url" {
  category     = "terraform"
  description  = "Okta org domain"
  workspace_id = tfe_workspace.dev_okta_terraform.id
  hcl          = false
  sensitive    = false
  key          = "base_url"
  value        = "oktapreview.com"
}

resource "tfe_variable" "dev_okta_terraform_domain" {
  category     = "terraform"
  description  = "Default email address domain for all users in this Okta org"
  workspace_id = tfe_workspace.dev_okta_terraform.id
  hcl          = false
  sensitive    = false
  key          = "domain"
  value        = "includedhealth.com"
}

resource "tfe_variable" "dev_okta_terraform_brand_name" {
  category     = "terraform"
  description  = "Full company brand name used for this Okta org"
  workspace_id = tfe_workspace.dev_okta_terraform.id
  hcl          = false
  sensitive    = false
  key          = "brand_name"
  value        = "Included Dev Sandbox"
}

  resource "tfe_workspace" "dev_okta_terraform" {
  name               = "dev-okta-terraform"
  organization       = var.org_name
  description        = "Workspace to build the Included Dev Okta org via infrastructure-as-code"
  allow_destroy_plan = false
  terraform_version  = "1.5.6"
}


