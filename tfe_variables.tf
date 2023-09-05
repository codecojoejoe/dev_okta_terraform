v# ------------------------------------------------------------------------------------------
# Okta sandbox

resource "tfe_variable" "okta_sandbox_terraform_org_name" {
  category     = "terraform"
  description  = "Okta org sub-domain"
  workspace_id = tfe_workspace.okta_sandbox_terraform.id
  hcl          = false
  sensitive    = false
  key          = "org_name"
  value        = "included-dev"
}

resource "tfe_variable" "okta_sandbox_terraform_base_url" {
  category     = "terraform"
  description  = "Okta org domain"
  workspace_id = tfe_workspace.okta_sandbox_terraform.id
  hcl          = false
  sensitive    = false
  key          = "base_url"
  value        = "oktapreview.com"
}

resource "tfe_variable" "okta_sandbox_terraform_domain" {
  category     = "terraform"
  description  = "Default email address domain for all users in this Okta org"
  workspace_id = tfe_workspace.okta_sandbox_terraform.id
  hcl          = false
  sensitive    = false
  key          = "domain"
  value        = "includedhealth.com"
}

resource "tfe_variable" "okta_sandbox_terraform_brand_name" {
  category     = "terraform"
  description  = "Full company brand name used for this Okta org"
  workspace_id = tfe_workspace.okta_sandbox_terraform.id
  hcl          = false
  sensitive    = false
  key          = "brand_name"
  value        = "Included Health Sandbox"
}

resource "tfe_variable" "okta_sandbox_terraform_human_okta_admin_users" {
  category     = "terraform"
  description  = "Map of Okta user IDs for human Okta admin users in this Okta org"
  workspace_id = tfe_workspace.okta_sandbox_terraform.id
  hcl          = true
  sensitive    = false
  key          = "human_okta_admin_users"
  value        = <<EOT
{
  joe_willis            = "00u42qc0x3RqDgKNp1d7"
}
EOT
}

resource "tfe_variable" "okta_sandbox_terraform_applications" {
  category     = "terraform"
  description  = "Map of Okta application IDs for applications in this Okta org"
  workspace_id = tfe_workspace.okta_sandbox_terraform.id
  hcl          = true
  sensitive    = false
  key          = "applications"
  value        = <<EOT
{
}
EOT
}

resource "tfe_variable" "okta_sandbox_applications_deny_all_unauthorized_users" {
  category     = "terraform"
  description  = "List of applications that should have the deny_all_unauthorized_users signon policy"
  workspace_id = tfe_workspace.okta_sandbox_terraform.id
  hcl          = true
  sensitive    = false
  key          = "applications_deny_all_unauthorized_users"
  value        = <<EOT
[
  "okta_admin_console",
  "okta_browser_plugin",
  "okta_dashboard",
  "okta_workflows",
  "okta_workflows_oauth",
  "signon_test",
]
EOT
}


resource "tfe_variable" "okta_sandbox_applications_deny_unmanaged_windows_clients" {
  category     = "terraform"
  description  = "List of applications that should be denied to unmanaged windows clients"
  workspace_id = tfe_workspace.okta_sandbox_terraform.id
  hcl          = true
  sensitive    = false
  key          = "applications_deny_unmanaged_windows_clients"
  value        = <<EOT
[
  "signon_test",
]
EOT
}

resource "tfe_variable" "okta_applications_deny_external_network_zones" {
  category     = "terraform"
  description  = "List of applications that should have the deny_external_network_zones policy"
  workspace_id = tfe_workspace.okta_sandbox_terraform.id
  hcl          = true
  sensitive    = false
  key          = "applications_deny_external_network_zones"
  value        = <<EOT
[
  "signon_test",
]
EOT
}

resource "tfe_variable" "okta_sandbox_applications_require_mfa_every_sign_on" {
  category     = "terraform"
  description  = "List of applications that should have the require_mfa_every_sign_on signon policy"
  workspace_id = tfe_workspace.okta_sandbox_terraform.id
  hcl          = true
  sensitive    = false
  key          = "applications_require_mfa_every_sign_on"
  value        = <<EOT
[
  "signon_test",
]
EOT
}
