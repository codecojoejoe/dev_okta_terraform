# ------------------------------------------------------------------------------------------
# All terraform-configurable authenticators (referred to as factors before OIE)

resource "okta_factor" "fido_webauthn" {
  provider_id = "fido_webauthn"
  active      = true
}

resource "okta_factor" "okta_push" {
  provider_id = "okta_push"
  active      = true
}

resource "okta_factor" "okta_otp" {
  provider_id = "okta_otp"
  active      = true
}

resource "okta_factor" "google_otp" {
  provider_id = "google_otp"
  active      = true
}

resource "okta_factor" "okta_password" {
  provider_id = "okta_password"
  active      = true
}

resource "okta_factor" "okta_email" {
  provider_id = "okta_email"
  active      = false
}

resource "okta_factor" "yubikey_token" {
  provider_id = "yubikey_token"
  active      = true
}
