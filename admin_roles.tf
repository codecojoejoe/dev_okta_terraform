# ------------------------------------------------------------------------------------------
# Read-Only Okta Admins

locals {
  human_okta_read_only_admin_users = toset([

  ])
}

resource "okta_user_group_memberships" "group_read_only_admins_membership" {
  for_each = local.human_okta_read_only_admin_users

  user_id = each.value
  groups = [
    okta_group.terraform_assigned_groups["okta_admin_read_only"].id,
  ]
}

resource "okta_group_role" "okta_admin_read_only_read_only" {
  group_id  = okta_group.terraform_assigned_groups["okta_admin_read_only"].id
  role_type = "READ_ONLY_ADMIN"
}

# ------------------------------------------------------------------------------------------
# IT MSP Okta Admins

locals {
  human_okta_it_msp_admin_users = toset([
 
  ])
}

resource "okta_user_group_memberships" "group_it_msp_admins_membership" {
  for_each = local.human_okta_it_msp_admin_users

  user_id = each.value
  groups = [
    okta_group.terraform_assigned_groups["okta_admin_it_msp"].id,
  ]
}

resource "okta_group_role" "okta_admin_it_msp_help_desk" {
  group_id  = okta_group.terraform_assigned_groups["okta_admin_it_msp"].id
  role_type = "HELP_DESK_ADMIN"
  target_group_list = [
    okta_group.okta_inherited_groups["all_non_admins"].id,
    okta_group.terraform_assigned_groups["okta_admin_it_msp"].id,
  ]
}

resource "okta_group_role" "okta_admin_it_msp_read_only" {
  group_id  = okta_group.terraform_assigned_groups["okta_admin_it_msp"].id
  role_type = "READ_ONLY_ADMIN"
}

# ------------------------------------------------------------------------------------------
# Product Support Okta Admins

locals {
  human_okta_prod_support_admin_users = toset([

  ])
}

resource "okta_user_group_memberships" "group_prod_support_admins_membership" {
  for_each = local.human_okta_prod_support_admin_users

  user_id = each.value
  groups = [
    okta_group.terraform_assigned_groups["okta_admin_prod_support"].id,
  ]
}

resource "okta_group_role" "okta_admin_prod_support_group_membership" {
  group_id  = okta_group.terraform_assigned_groups["okta_admin_prod_support"].id
  role_type = "GROUP_MEMBERSHIP_ADMIN"
  target_group_list = [

  ]
}

resource "okta_group_role" "okta_admin_prod_support_help_desk" {
  group_id  = okta_group.terraform_assigned_groups["okta_admin_prod_support"].id
  role_type = "HELP_DESK_ADMIN"
  target_group_list = [
    okta_group.okta_inherited_groups["all_non_admins"].id,
    okta_group.terraform_assigned_groups["okta_admin_prod_support"].id,
  ]
}

resource "okta_group_role" "okta_admin_prod_support_read_only" {
  group_id  = okta_group.terraform_assigned_groups["okta_admin_prod_support"].id
  role_type = "READ_ONLY_ADMIN"
}

# ------------------------------------------------------------------------------------------
# IT Support Lead Okta Admins

locals {
  human_okta_it_support_lead_admin_users = toset([

  ])
}

resource "okta_user_group_memberships" "group_it_support_lead_admins_membership" {
  for_each = local.human_okta_it_support_lead_admin_users

  user_id = each.value
  groups = [
    okta_group.terraform_assigned_groups["okta_admin_it_support_lead"].id,
  ]
}

resource "okta_group_role" "okta_admin_it_support_lead_group_membership" {
  group_id  = okta_group.terraform_assigned_groups["okta_admin_it_support_lead"].id
  role_type = "GROUP_MEMBERSHIP_ADMIN"
  target_group_list = [
    okta_group.okta_assigned_groups["okta_onboarding_username_confirmed"].id,
    okta_group.okta_assigned_groups["okta_sign_on_allow_mobile_access"].id,
  ]
}

# ------------------------------------------------------------------------------------------
# IT Okta Admins

locals {
  human_okta_it_admin_users = toset([

  ])
}

resource "okta_user_group_memberships" "group_it_admins_membership" {
  for_each = local.human_okta_it_admin_users

  user_id = each.value
  groups = [
    okta_group.terraform_assigned_groups["okta_admin_it"].id,
  ]
}

resource "okta_group_role" "okta_admin_it_group_membership" {
  group_id  = okta_group.terraform_assigned_groups["okta_admin_it"].id
  role_type = "GROUP_MEMBERSHIP_ADMIN"
  target_group_list = [
  ]
}

resource "okta_group_role" "okta_admin_it_help_desk" {
  group_id  = okta_group.terraform_assigned_groups["okta_admin_it"].id
  role_type = "HELP_DESK_ADMIN"
  target_group_list = [

  ]
}

resource "okta_group_role" "okta_admin_it_read_only" {
  group_id  = okta_group.terraform_assigned_groups["okta_admin_it"].id
  role_type = "READ_ONLY_ADMIN"
}

# ------------------------------------------------------------------------------------------
# Okta Super Admins

locals {
  human_okta_super_admin_users = toset([
    var.human_okta_admin_users["joe_willis"], 
  ])
}

resource "okta_user_group_memberships" "group_super_admins_membership" {
  for_each = local.human_okta_super_admin_users

  user_id = each.value
  groups = [
    okta_group.terraform_assigned_groups["okta_admin_super_admin"].id,
  ]
}

resource "okta_group_role" "okta_admin_super_admin_super_admin" {
  group_id  = okta_group.terraform_assigned_groups["okta_admin_super_admin"].id
  role_type = "SUPER_ADMIN"
}

# ------------------------------------------------------------------------------------------
# Service accounts with Okta Super Admin privileges

resource "okta_group_role" "okta_admin_super_admin_service_accounts_super_admin" {
  group_id  = okta_group.terraform_assigned_groups["okta_admin_super_admin_service_accounts"].id
  role_type = "SUPER_ADMIN"
}

# ------------------------------------------------------------------------------------------
# Service accounts with Read-Only Okta admin privileges

resource "okta_group_role" "okta_admin_read_only_service_accounts_read_only" {
  group_id  = okta_group.terraform_assigned_groups["okta_admin_read_only_service_accounts"].id
  role_type = "READ_ONLY_ADMIN"
}

# ------------------------------------------------------------------------------------------
# Okta custom admin role declarations. Add your new custom admin role information below. Don't change existing ones


locals {
  custom_admins = [
    {
      id          = "app_reader",
      name        = "App Reader",
      description = "This role grants app read permissions for the assigned resource set",
      permissions = [
        "okta.apps.read"
      ]
    },
    {
      id          = "it_custom_administrators_group_management",
      name        = "IT Custom Administrators - Group Management",
      description = "This role gives permissions to manage certain group memberships defined in the Resource Set",
      permissions = [
        "okta.groups.read",
        "okta.groups.members.manage",
        "okta.groups.manage"
      ]
    }
  ]
}

# This creates those custom admin roles from above local variable declarations. 
resource "okta_admin_role_custom" "ih_custom_admin_roles" {
  for_each    = { for custom_admin in local.custom_admins : custom_admin.id => custom_admin }
  label       = each.value.name
  description = each.value.description
  permissions = each.value.permissions
}


locals {
  custom_roles_template = { for mapping in local.custom_admin_mappings_csv : format("%s<=>%s", mapping.custom_role, mapping.resource_set) => mapping.id... }
}


resource "okta_admin_role_custom_assignments" "custom_role_assignment_bindings" {
  for_each        = local.custom_roles_template
  resource_set_id = local.resources[split("<=>", each.key)[1]].id
  custom_role_id  = local.custom_admin_roles[split("<=>", each.key)[0]].id
  members = [
    for id in each.value : contains(local.service_account_list, id) ? local.service_accounts[id].url : local.groups[id].url
  ]
}


# #This binding/assignment maps those custom admin roles, resource sets and users/groups with those custom admin permissionss
# resource "okta_admin_role_custom_assignments" "custom_role_assignment_bindings" {
#   for_each        = { for custom_admin_mapping in local.custom_admin_mappings_csv : format("%s+%s+%s", custom_admin_mapping.id, custom_admin_mapping.resource_set, custom_admin_mapping.custom_role) => custom_admin_mapping }
#   resource_set_id = local.resources[each.value.resource_set].id
#   custom_role_id  = local.custom_admin_roles[each.value.custom_role].id
#   members = [
#     contains(local.service_account_list, each.value.id) ? local.service_accounts[each.value.id].url : local.groups[each.value.id].url
#   ]
# }
