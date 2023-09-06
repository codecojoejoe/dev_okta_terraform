# ------------------------------------------------------------------------------------------
# Admin password policy

resource "okta_policy_password" "admin_password_policy" {
  name                                   = "Admin Accounts"
  priority                               = 1
  auth_provider                          = "OKTA"
  status                                 = "ACTIVE"
  description                            = "DO NOT EDIT - Managed by Terraform"
  password_min_length                    = 12
  password_min_lowercase                 = 1
  password_min_uppercase                 = 0
  password_min_number                    = 0
  password_min_symbol                    = 1
  password_exclude_username              = true
  password_exclude_first_name            = true
  password_exclude_last_name             = true
  password_dictionary_lookup             = true
  password_history_count                 = 15
  password_min_age_minutes               = 60
  password_max_age_days                  = 180
  password_expire_warn_days              = 14
  password_max_lockout_attempts          = 10
  password_auto_unlock_minutes           = 10
  password_show_lockout_failures         = true
  password_lockout_notification_channels = ["EMAIL"]
  recovery_email_token                   = 3600
  email_recovery                         = "ACTIVE"
  sms_recovery                           = "INACTIVE"
  call_recovery                          = "INACTIVE"
  question_recovery                      = "INACTIVE"
  groups_included = [
    okta_group.terraform_assigned_groups["okta_admin_super_admin"].id,
    okta_group.terraform_assigned_groups["okta_admin_it_support_lead"].id,
    okta_group.terraform_assigned_groups["okta_admin_it"].id,
    okta_group.terraform_assigned_groups["okta_admin_prod_support"].id,
    okta_group.terraform_assigned_groups["okta_admin_it_msp"].id,
    okta_group.terraform_assigned_groups["okta_admin_read_only"].id,
  ]
}

resource "okta_policy_rule_password" "admin_password_policy_rule_1" {
  policy_id          = okta_policy_password.admin_password_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  password_change    = "ALLOW"
  password_reset     = "ALLOW"
  password_unlock    = "ALLOW"
  network_connection = "ANYWHERE"
}

# ------------------------------------------------------------------------------------------
# Admin Service Account password policy

resource "okta_policy_password" "admin_service_account_password_policy" {
  name                           = "Admin Service Accounts"
  priority                       = 2
  auth_provider                  = "OKTA"
  status                         = "ACTIVE"
  description                    = "DO NOT EDIT - Managed by Terraform"
  password_min_length            = 12
  password_min_lowercase         = 1
  password_min_uppercase         = 0
  password_min_number            = 0
  password_min_symbol            = 1
  password_exclude_username      = true
  password_exclude_first_name    = true
  password_exclude_last_name     = true
  password_dictionary_lookup     = true
  password_max_lockout_attempts  = 10
  password_auto_unlock_minutes   = 10
  password_show_lockout_failures = true
  recovery_email_token           = 3600
  email_recovery                 = "ACTIVE"
  sms_recovery                   = "INACTIVE"
  call_recovery                  = "INACTIVE"
  question_recovery              = "INACTIVE"
  groups_included = [
    okta_group.terraform_assigned_groups["okta_admin_super_admin_service_accounts"].id,
  ]
}

resource "okta_policy_rule_password" "admin_service_account_password_policy_rule_1" {
  policy_id          = okta_policy_password.admin_service_account_password_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  password_change    = "ALLOW"
  password_reset     = "ALLOW"
  password_unlock    = "ALLOW"
  network_connection = "ANYWHERE"
}

# ------------------------------------------------------------------------------------------
# Service Account password policy

resource "okta_policy_password" "service_account_password_policy" {
  name                           = "Service Accounts"
  priority                       = 3
  auth_provider                  = "OKTA"
  status                         = "ACTIVE"
  description                    = "DO NOT EDIT - Managed by Terraform"
  password_min_length            = 12
  password_min_lowercase         = 1
  password_min_uppercase         = 0
  password_min_number            = 0
  password_min_symbol            = 1
  password_exclude_username      = true
  password_exclude_first_name    = true
  password_exclude_last_name     = true
  password_dictionary_lookup     = true
  password_max_lockout_attempts  = 10
  password_auto_unlock_minutes   = 10
  password_show_lockout_failures = true
  recovery_email_token           = 3600
  email_recovery                 = "ACTIVE"
  sms_recovery                   = "INACTIVE"
  call_recovery                  = "INACTIVE"
  question_recovery              = "INACTIVE"
  groups_included = [
    okta_group.terraform_assigned_groups["type_service_accounts"].id,
  ]
}

resource "okta_policy_rule_password" "service_account_password_policy_rule_1" {
  policy_id          = okta_policy_password.service_account_password_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  password_change    = "DENY"
  password_reset     = "DENY"
  password_unlock    = "ALLOW"
  network_connection = "ANYWHERE"
}

# ------------------------------------------------------------------------------------------
# Production password policy

resource "okta_policy_password" "production_password_policy" {
  name                                   = "Everyone"
  priority                               = 4
  auth_provider                          = "OKTA"
  status                                 = "ACTIVE"
  description                            = "DO NOT EDIT - Managed by Terraform"
  password_min_length                    = 12
  password_min_lowercase                 = 1
  password_min_uppercase                 = 0
  password_min_number                    = 0
  password_min_symbol                    = 1
  password_exclude_username              = true
  password_exclude_first_name            = true
  password_exclude_last_name             = true
  password_dictionary_lookup             = true
  password_history_count                 = 15
  password_min_age_minutes               = 60
  password_max_age_days                  = 180
  password_expire_warn_days              = 14
  password_max_lockout_attempts          = 10
  password_auto_unlock_minutes           = 10
  password_show_lockout_failures         = true
  password_lockout_notification_channels = ["EMAIL"]
  recovery_email_token                   = 3600
  email_recovery                         = "ACTIVE"
  sms_recovery                           = "INACTIVE"
  call_recovery                          = "INACTIVE"
  question_recovery                      = "INACTIVE"
  groups_included = [
    data.okta_group.everyone.id,
  ]
}

resource "okta_policy_rule_password" "production_password_policy_rule_1" {
  policy_id          = okta_policy_password.production_password_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  password_change    = "ALLOW"
  password_reset     = "ALLOW"
  password_unlock    = "ALLOW"
  network_connection = "ANYWHERE"
}

# ------------------------------------------------------------------------------------------
# (Built-in) default password policy

resource "okta_policy_password_default" "default_password_policy" {
  password_min_length                    = 12
  password_min_lowercase                 = 1
  password_min_uppercase                 = 0
  password_min_number                    = 0
  password_min_symbol                    = 1
  password_exclude_username              = true
  password_exclude_first_name            = true
  password_exclude_last_name             = true
  password_dictionary_lookup             = true
  password_history_count                 = 15
  password_min_age_minutes               = 60
  password_max_age_days                  = 180
  password_expire_warn_days              = 14
  password_max_lockout_attempts          = 10
  password_auto_unlock_minutes           = 10
  password_show_lockout_failures         = true
  password_lockout_notification_channels = ["EMAIL"]
  recovery_email_token                   = 3600
  email_recovery                         = "ACTIVE"
  sms_recovery                           = "INACTIVE"
  call_recovery                          = "INACTIVE"
  question_recovery                      = "INACTIVE"
}

resource "okta_policy_rule_password" "default_password_policy_rule_1" {
  policy_id          = okta_policy_password_default.default_password_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  status             = "ACTIVE"
  password_change    = "ALLOW"
  password_reset     = "ALLOW"
  password_unlock    = "ALLOW"
  network_connection = "ANYWHERE"
}
