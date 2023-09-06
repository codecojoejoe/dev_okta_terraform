# ------------------------------------------------------------------------------------------
# Admin sign-on policy

resource "okta_policy_signon" "admin_signon_policy" {
  name        = "Admin Accounts"
  priority    = 1
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  groups_included = [
    okta_group.terraform_assigned_groups["okta_admin_super_admin"].id,
    okta_group.terraform_assigned_groups["okta_admin_super_admin_service_accounts"].id,
    okta_group.terraform_assigned_groups["okta_admin_it_support_lead"].id,
    okta_group.terraform_assigned_groups["okta_admin_it"].id,
    okta_group.terraform_assigned_groups["okta_admin_prod_support"].id,
    okta_group.terraform_assigned_groups["okta_admin_it_msp"].id,
    okta_group.terraform_assigned_groups["okta_admin_read_only"].id,
  ]
}

resource "okta_policy_rule_signon" "admin_signon_policy_rule_1" {
  policy_id           = okta_policy_signon.admin_signon_policy.id
  name                = "DO NOT EDIT - Managed by Terraform"
  priority            = 1
  status              = "ACTIVE"
  network_connection  = "ANYWHERE"
  authtype            = "ANY"
  access              = "ALLOW"
  mfa_required        = true
  mfa_prompt          = "ALWAYS"
  mfa_remember_device = false
  session_idle        = 120
  session_lifetime    = 120
  session_persistent  = false
  users_excluded      = []
}

# ------------------------------------------------------------------------------------------
# Read-Only Service Account sign-on policy

resource "okta_policy_signon" "read_only_service_account_signon_policy" {
  name        = "Read-Only Service Accounts"
  priority    = 2
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  groups_included = [
    okta_group.terraform_assigned_groups["okta_admin_read_only_service_accounts"].id,
  ]
}

resource "okta_policy_rule_signon" "read_only_service_account_signon_policy_rule_1" {
  policy_id          = okta_policy_signon.read_only_service_account_signon_policy.id
  name               = "DO NOT EDIT - Managed by Terraform - 1"
  priority           = 1
  status             = "ACTIVE"
  network_connection = "ANYWHERE"
  authtype           = "LDAP_INTERFACE"
  access             = "ALLOW"
  mfa_required       = false
  session_idle       = 10
  session_lifetime   = 120
  session_persistent = false
  users_excluded     = []
}

resource "okta_policy_rule_signon" "read_only_service_account_signon_policy_rule_2" {
  policy_id           = okta_policy_signon.read_only_service_account_signon_policy.id
  name                = "DO NOT EDIT - Managed by Terraform - 2"
  priority            = 2
  status              = "ACTIVE"
  network_connection  = "ANYWHERE"
  authtype            = "ANY"
  access              = "ALLOW"
  mfa_required        = true
  mfa_prompt          = "ALWAYS"
  mfa_remember_device = false
  session_idle        = 10
  session_lifetime    = 120
  session_persistent  = false
  users_excluded      = []
}

# ------------------------------------------------------------------------------------------
# Service Account sign-on policy

resource "okta_policy_signon" "service_account_signon_policy" {
  name        = "Service Accounts"
  priority    = 3
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  groups_included = [
    okta_group.terraform_assigned_groups["type_service_accounts"].id,
  ]
}

resource "okta_policy_rule_signon" "service_account_signon_policy_rule_1" {
  policy_id           = okta_policy_signon.service_account_signon_policy.id
  name                = "DO NOT EDIT - Managed by Terraform"
  priority            = 1
  status              = "ACTIVE"
  network_connection  = "ANYWHERE"
  authtype            = "ANY"
  access              = "ALLOW"
  mfa_required        = true
  mfa_prompt          = "ALWAYS"
  mfa_remember_device = false
  session_idle        = 10
  session_lifetime    = 120
  session_persistent  = false
  users_excluded      = []
}

# ------------------------------------------------------------------------------------------
# Zero Touch - MFA Exempt policy

resource "okta_policy_signon" "zero_touch_signon_policy" {
  name        = "Zero Touch - MFA Exempt"
  priority    = 4
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  groups_included = [
    okta_group.okta_assigned_groups["zero_touch"].id,
    okta_group.hr_inherited_groups["zero_touch_new_hires"].id,
  ]
}

resource "okta_policy_rule_signon" "zero_touch_signon_policy_rule_1" {
  policy_id          = okta_policy_signon.zero_touch_signon_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  network_connection = "ANYWHERE"
  authtype           = "ANY"
  access             = "ALLOW"
  mfa_required       = false
  session_idle       = 15
  session_lifetime   = 15
  session_persistent = false
  users_excluded     = []
}

# ------------------------------------------------------------------------------------------
# Production sign-on policy

resource "okta_policy_signon" "production_signon_policy" {
  name        = "Everyone"
  priority    = 5
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  groups_included = [
    data.okta_group.everyone.id,
  ]
}

resource "okta_policy_rule_signon" "production_signon_policy_rule_1" {
  policy_id           = okta_policy_signon.production_signon_policy.id
  name                = "DO NOT EDIT - Managed by Terraform"
  priority            = 1
  status              = "ACTIVE"
  network_connection  = "ANYWHERE"
  authtype            = "ANY"
  access              = "ALLOW"
  mfa_required        = true
  mfa_prompt          = "ALWAYS"
  mfa_remember_device = false
  session_idle        = 720
  session_lifetime    = 720
  session_persistent  = true
  users_excluded      = []
}
