# ------------------------------------------------------------------------------------------
# MSP Enhanced Admin multifactor policy

resource "okta_policy_mfa" "msp_enhanced_admin_mfa_policy" {
  name        = "MSP Enhanced Admin"
  priority    = 1
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  is_oie      = false

  fido_webauthn = {
    enroll = "OPTIONAL"
  }

  okta_push = {
    enroll = "REQUIRED"
  }

  okta_otp = {
    enroll = "REQUIRED"
  }

  google_otp = {
    enroll = "NOT_ALLOWED"
  }

  okta_password = {
    enroll = "REQUIRED"
  }

  okta_email = {
    enroll = "NOT_ALLOWED"
  }

  yubikey_token = {
    enroll = "NOT_ALLOWED"
  }

  groups_included = [
    okta_group.okta_assigned_groups["okta_jamf_webauthn_exception"].id,
  ]

  depends_on = [
    okta_factor.fido_webauthn,
    okta_factor.okta_push,
    okta_factor.okta_otp,
    okta_factor.google_otp,
    okta_factor.okta_password,
    okta_factor.okta_email,
    okta_factor.yubikey_token,
  ]
}

resource "okta_policy_rule_mfa" "msp_enhanced_admin_mfa_policy_rule_1" {
  policy_id          = okta_policy_mfa.msp_enhanced_admin_mfa_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  enroll             = "LOGIN"
  network_connection = "ANYWHERE"
  users_excluded     = []
}

# ------------------------------------------------------------------------------------------
# Admin multifactor policy

resource "okta_policy_mfa" "admin_mfa_policy" {
  name        = "Admins"
  priority    = 2
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  is_oie      = false

  fido_webauthn = {
    enroll = "REQUIRED"
  }

  okta_push = {
    enroll = "REQUIRED"
  }

  okta_otp = {
    enroll = "REQUIRED"
  }

  google_otp = {
    enroll = "NOT_ALLOWED"
  }

  okta_password = {
    enroll = "REQUIRED"
  }

  okta_email = {
    enroll = "NOT_ALLOWED"
  }

  yubikey_token = {
    enroll = "NOT_ALLOWED"
  }

  groups_included = [
    okta_group.terraform_assigned_groups["okta_admin_super_admin"].id,
    okta_group.terraform_assigned_groups["okta_admin_it_support_lead"].id,
    okta_group.terraform_assigned_groups["okta_admin_it"].id,
    okta_group.terraform_assigned_groups["okta_admin_prod_support"].id,
  ]

  depends_on = [
    okta_factor.fido_webauthn,
    okta_factor.okta_push,
    okta_factor.okta_otp,
    okta_factor.google_otp,
    okta_factor.okta_password,
    okta_factor.okta_email,
    okta_factor.yubikey_token,
  ]
}

resource "okta_policy_rule_mfa" "admin_mfa_policy_rule_1" {
  policy_id          = okta_policy_mfa.admin_mfa_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  enroll             = "LOGIN"
  network_connection = "ANYWHERE"
  users_excluded     = []
}

# ------------------------------------------------------------------------------------------
# Admin service account multifactor policy

resource "okta_policy_mfa" "admin_service_account_mfa_policy" {
  name        = "Admin Service Accounts"
  priority    = 3
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  is_oie      = false

  fido_webauthn = {
    enroll = "REQUIRED"
  }

  okta_push = {
    enroll = "OPTIONAL"
  }

  okta_otp = {
    enroll = "OPTIONAL"
  }

  google_otp = {
    enroll = "NOT_ALLOWED"
  }

  okta_password = {
    enroll = "REQUIRED"
  }

  okta_email = {
    enroll = "NOT_ALLOWED"
  }

  yubikey_token = {
    enroll = "NOT_ALLOWED"
  }

  groups_included = [
    okta_group.terraform_assigned_groups["okta_admin_super_admin_service_accounts"].id,
  ]

  depends_on = [
    okta_factor.fido_webauthn,
    okta_factor.okta_push,
    okta_factor.okta_otp,
    okta_factor.google_otp,
    okta_factor.okta_password,
    okta_factor.okta_email,
    okta_factor.yubikey_token,
  ]
}

resource "okta_policy_rule_mfa" "admin_service_account_mfa_policy_rule_1" {
  policy_id          = okta_policy_mfa.admin_service_account_mfa_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  enroll             = "LOGIN"
  network_connection = "ANYWHERE"
  users_excluded     = []
}

# ------------------------------------------------------------------------------------------
# Minimal Admin multifactor policy

resource "okta_policy_mfa" "minimal_admin_mfa_policy" {
  name        = "Minimal Admins"
  priority    = 4
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  is_oie      = false

  fido_webauthn = {
    enroll = "OPTIONAL"
  }

  okta_push = {
    enroll = "REQUIRED"
  }

  okta_otp = {
    enroll = "REQUIRED"
  }

  google_otp = {
    enroll = "NOT_ALLOWED"
  }

  okta_password = {
    enroll = "REQUIRED"
  }

  okta_email = {
    enroll = "NOT_ALLOWED"
  }

  yubikey_token = {
    enroll = "NOT_ALLOWED"
  }

  groups_included = [
    okta_group.terraform_assigned_groups["okta_admin_it_msp"].id,
    okta_group.terraform_assigned_groups["okta_admin_read_only"].id,
  ]

  depends_on = [
    okta_factor.fido_webauthn,
    okta_factor.okta_push,
    okta_factor.okta_otp,
    okta_factor.google_otp,
    okta_factor.okta_password,
    okta_factor.okta_email,
    okta_factor.yubikey_token,
  ]
}

resource "okta_policy_rule_mfa" "minimal_admin_mfa_policy_rule_1" {
  policy_id          = okta_policy_mfa.minimal_admin_mfa_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  enroll             = "LOGIN"
  network_connection = "ANYWHERE"
  users_excluded     = []
}

# ------------------------------------------------------------------------------------------
# Service Account multifactor policy

resource "okta_policy_mfa" "service_account_mfa_policy" {
  name        = "Service Accounts"
  priority    = 5
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  is_oie      = false

  fido_webauthn = {
    enroll = "NOT_ALLOWED"
  }

  okta_push = {
    enroll = "NOT_ALLOWED"
  }

  okta_otp = {
    enroll = "NOT_ALLOWED"
  }

  google_otp = {
    enroll = "REQUIRED"
  }

  okta_password = {
    enroll = "REQUIRED"
  }

  okta_email = {
    enroll = "NOT_ALLOWED"
  }

  yubikey_token = {
    enroll = "NOT_ALLOWED"
  }

  groups_included = [
    okta_group.terraform_assigned_groups["type_service_accounts"].id,
  ]

  depends_on = [
    okta_factor.fido_webauthn,
    okta_factor.okta_push,
    okta_factor.okta_otp,
    okta_factor.google_otp,
    okta_factor.okta_password,
    okta_factor.okta_email,
    okta_factor.yubikey_token,
  ]
}

resource "okta_policy_rule_mfa" "service_account_mfa_policy_rule_1" {
  policy_id          = okta_policy_mfa.service_account_mfa_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  enroll             = "LOGIN"
  network_connection = "ANYWHERE"
  users_excluded     = []
}

# ------------------------------------------------------------------------------------------
# Zero Touch - MFA Exempt

resource "okta_policy_mfa" "zero_touch_mfa_policy" {
  name        = "Zero Touch - MFA Exempt"
  priority    = 6
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  is_oie      = false

  fido_webauthn = {
    enroll = "NOT_ALLOWED"
  }

  okta_push = {
    enroll = "NOT_ALLOWED"
  }

  okta_otp = {
    enroll = "NOT_ALLOWED"
  }

  google_otp = {
    enroll = "NOT_ALLOWED"
  }

  okta_email = {
    enroll = "NOT_ALLOWED"
  }

  okta_password = {
    enroll = "REQUIRED"
  }

  yubikey_token = {
    enroll = "NOT_ALLOWED"
  }

  groups_included = [
    okta_group.hr_inherited_groups["zero_touch_new_hires"].id,
    okta_group.okta_assigned_groups["zero_touch"].id,
  ]

  depends_on = [
    okta_factor.fido_webauthn,
    okta_factor.okta_push,
    okta_factor.okta_otp,
    okta_factor.google_otp,
    okta_factor.okta_email,
    okta_factor.okta_password,
    okta_factor.yubikey_token,
  ]
}

resource "okta_policy_rule_mfa" "zero_touch_mfa_policy_rule_1" {
  policy_id          = okta_policy_mfa.zero_touch_mfa_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  enroll             = "LOGIN"
  network_connection = "ANYWHERE"
  users_excluded     = []
}

# ------------------------------------------------------------------------------------------
# Jamf Yubikey Exception

resource "okta_policy_mfa" "jamf_yubikey_exception_mfa_policy" {
  name        = "Jamf Yubikey Exception"
  priority    = 7
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  is_oie      = true

  fido_webauthn = {
    enroll = "OPTIONAL"
  }

  okta_push = {
    enroll = "OPTIONAL"
  }

  okta_otp = {
    enroll = "OPTIONAL"
  }

  google_otp = {
    enroll = "NOT_ALLOWED"
  }

  okta_email = {
    enroll = "NOT_ALLOWED"
  }

  okta_password = {
    enroll = "REQUIRED"
  }

  yubikey_token = {
    enroll = "OPTIONAL"
  }

  groups_included = [
    okta_group.okta_assigned_groups["okta_jamf_yubikey_exception"].id,
  ]

  depends_on = [
    okta_factor.fido_webauthn,
    okta_factor.okta_push,
    okta_factor.okta_otp,
    okta_factor.google_otp,
    okta_factor.okta_email,
    okta_factor.okta_password,
    okta_factor.yubikey_token,
  ]
}

resource "okta_policy_rule_mfa" "jamf_yubikey_exception_policy_rule_1" {
  policy_id          = okta_policy_mfa.jamf_yubikey_exception_mfa_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  enroll             = "LOGIN"
  network_connection = "ANYWHERE"
  users_excluded     = []
}

# ------------------------------------------------------------------------------------------
# Google Authenticator Exception

resource "okta_policy_mfa" "google_auth_exception_mfa_policy" {
  name        = "Google Authenticator Exception"
  priority    = 8
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  is_oie      = false

  fido_webauthn = {
    enroll = "OPTIONAL"
  }

  okta_push = {
    enroll = "OPTIONAL"
  }

  okta_otp = {
    enroll = "OPTIONAL"
  }

  google_otp = {
    enroll = "REQUIRED"
  }

  okta_email = {
    enroll = "NOT_ALLOWED"
  }

  okta_password = {
    enroll = "REQUIRED"
  }

  yubikey_token = {
    enroll = "NOT_ALLOWED"
  }

  groups_included = [
    okta_group.okta_assigned_groups["sg_google_auth_exception"].id,
  ]

  depends_on = [
    okta_factor.fido_webauthn,
    okta_factor.okta_push,
    okta_factor.okta_otp,
    okta_factor.google_otp,
    okta_factor.okta_email,
    okta_factor.okta_password,
    okta_factor.yubikey_token,
  ]
}

resource "okta_policy_rule_mfa" "google_auth_exception_policy_rule_1" {
  policy_id          = okta_policy_mfa.google_auth_exception_mfa_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  enroll             = "LOGIN"
  network_connection = "ANYWHERE"
  users_excluded     = []
}
# ------------------------------------------------------------------------------------------
# Production multifactor policy

resource "okta_policy_mfa" "production_mfa_policy" {
  name        = "Everyone"
  priority    = 9
  status      = "ACTIVE"
  description = "DO NOT EDIT - Managed by Terraform"
  is_oie      = false

  fido_webauthn = {
    enroll = "OPTIONAL"
  }

  okta_push = {
    enroll = "REQUIRED"
  }

  okta_otp = {
    enroll = "REQUIRED"
  }

  google_otp = {
    enroll = "NOT_ALLOWED"
  }

  okta_email = {
    enroll = "NOT_ALLOWED"
  }

  okta_password = {
    enroll = "REQUIRED"
  }

  yubikey_token = {
    enroll = "NOT_ALLOWED"
  }

  groups_included = [
    data.okta_group.everyone.id,
  ]

  depends_on = [
    okta_factor.fido_webauthn,
    okta_factor.okta_push,
    okta_factor.okta_otp,
    okta_factor.google_otp,
    okta_factor.okta_password,
    okta_factor.okta_email,
    okta_factor.yubikey_token,
  ]
}

resource "okta_policy_rule_mfa" "production_mfa_policy_rule_1" {
  policy_id          = okta_policy_mfa.production_mfa_policy.id
  name               = "DO NOT EDIT - Managed by Terraform"
  priority           = 1
  status             = "ACTIVE"
  enroll             = "LOGIN"
  network_connection = "ANYWHERE"
  users_excluded     = []
}

# ------------------------------------------------------------------------------------------
# (Built-in) default multifactor policy

resource "okta_policy_mfa_default" "default_mfa_policy" {
  fido_webauthn = {
    enroll = "OPTIONAL"
  }

  okta_push = {
    enroll = "REQUIRED"
  }

  okta_otp = {
    enroll = "REQUIRED"
  }

  google_otp = {
    enroll = "NOT_ALLOWED"
  }

  okta_password = {
    enroll = "REQUIRED"
  }

  okta_email = {
    enroll = "NOT_ALLOWED"
  }

  depends_on = [
    okta_factor.fido_webauthn,
    okta_factor.okta_push,
    okta_factor.okta_otp,
    okta_factor.google_otp,
    okta_factor.okta_password,
    okta_factor.okta_email,
  ]
}
