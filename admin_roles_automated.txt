# ------------------------------------------------------------------------------------------
# Read-Only Okta Admins
locals {
 human_okta_read_only_admin_users = toset([

    local.okta_users["joe.willis"].id,

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
 group_id = okta_group.terraform_assigned_groups["okta_admin_read_only"].id
 role_type = "READ_ONLY_ADMIN"
}
# ------------------------------------------------------------------------------------------
