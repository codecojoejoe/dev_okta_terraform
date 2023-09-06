# ------------------------------------------------------------------------------------------
# All Okta service accounts

locals {
  service_accounts_no_okta_admin_csv = file("${path.module}/service_accounts_no_okta_admin.csv")
  service_accounts_no_okta_admin     = csvdecode(local.service_accounts_no_okta_admin_csv)
}

resource "okta_user" "service_accounts_no_okta_admin" {
  for_each = { for user in local.service_accounts_no_okta_admin : user.local_id => user }

  first_name   = "SRV-${each.value.first_name}"
  last_name    = each.value.last_name
  login        = "srv-${each.value.login}"
  email        = "srv-${each.value.login}@${var.domain}"
  second_email = "okta-service-accounts@${var.domain}"

  lifecycle {
    ignore_changes = [group_memberships]
  }
}

resource "okta_user_group_memberships" "service_accounts_no_okta_admin_groups_memberships" {
  for_each = okta_user.service_accounts_no_okta_admin

  user_id = each.value.id
  groups = [
    okta_group.terraform_assigned_groups["type_service_accounts"].id,
  ]
}

# ------------------------------------------------------------------------------------------
# Service accounts with Read-Only Okta admin privileges

locals {
  read_only_service_accounts_csv = file("${path.module}/service_accounts_read_only_okta_admin.csv")
  read_only_service_accounts     = csvdecode(local.read_only_service_accounts_csv)
}

resource "okta_user" "service_accounts_read_only_okta_admin" {
  for_each = { for user in local.read_only_service_accounts : user.local_id => user }

  first_name   = "SRV-${each.value.first_name}"
  last_name    = each.value.last_name
  login        = "srv-${each.value.login}"
  email        = "srv-${each.value.login}@${var.domain}"
  second_email = "okta-service-accounts@${var.domain}"

  lifecycle {
    ignore_changes = [group_memberships]
  }
}

resource "okta_user_group_memberships" "service_accounts_read_only_okta_admin_groups_memberships" {
  for_each = okta_user.service_accounts_read_only_okta_admin

  user_id = each.value.id
  groups = [
    okta_group.terraform_assigned_groups["type_service_accounts"].id,
    okta_group.terraform_assigned_groups["okta_admin_read_only_service_accounts"].id,
  ]
}

# ------------------------------------------------------------------------------------------
# Service accounts with Okta Super Admin privileges

locals {
  super_admin_service_accounts_csv = file("${path.module}/service_accounts_okta_super_admin.csv")
  super_admin_service_accounts     = csvdecode(local.super_admin_service_accounts_csv)
}

resource "okta_user" "service_accounts_okta_super_admin" {
  for_each = { for user in local.super_admin_service_accounts : user.local_id => user }

  first_name   = "SRV-${each.value.first_name}"
  last_name    = each.value.last_name
  login        = "srv-${each.value.login}"
  email        = "srv-${each.value.login}@${var.domain}"
  second_email = "okta-service-accounts@${var.domain}"

  lifecycle {
    ignore_changes = [group_memberships]
  }
}

resource "okta_user_group_memberships" "service_accounts_okta_super_admin_groups_memberships" {
  for_each = okta_user.service_accounts_okta_super_admin

  user_id = each.value.id
  groups = [
    okta_group.terraform_assigned_groups["type_service_accounts"].id,
    okta_group.terraform_assigned_groups["okta_admin_super_admin_service_accounts"].id,
  ]
}

# ------------------------------------------------------------------------------------------
# Service accounts with Custom Admin Privileges

locals {
  custom_admin_mappings_csv     = csvdecode(file("${path.module}/custom_admin_mappings.csv"))
  custom_admin_service_accounts = [for account in local.custom_admin_mappings_csv : account.id if contains(local.service_account_list, account.id)]
}


resource "okta_user_group_memberships" "service_accounts_okta_custom_admin_groups_memberships" {
  for_each = toset(local.custom_admin_service_accounts)
  user_id  = local.service_accounts[each.key].id
  groups = [
    local.groups["okta_admin_custom_admin_service_accounts"].id,
  ]
}