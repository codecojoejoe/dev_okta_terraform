# ------------------------------------------------------------------------------------------
# Built-in "Everyone" Okta group

data "okta_group" "everyone" {
  name = "Everyone"
}

# ------------------------------------------------------------------------------------------
# Groups with memberships that grant Okta admin roles, and the type_service_accounts group
# These groups must be populated via Terraform only
# TO BE IMPLEMENTED: Terraform will REVERT membership changes in these groups made outside of Terraform

locals {
  terraform_assigned_groups_csv = file("${path.module}/groups_assigned_terraform.csv")
  terraform_assigned_groups     = csvdecode(local.terraform_assigned_groups_csv)
}

resource "okta_group" "terraform_assigned_groups" {
  for_each = { for group in local.terraform_assigned_groups : group.local_id => group }

  name        = each.value.group_name
  description = each.value.group_description

  lifecycle {
    ignore_changes = [users]
  }
}

# ------------------------------------------------------------------------------------------
# Groups with memberships based on Okta user type
# These groups are populated by Okta group rules
# Terraform will IGNORE membership changes in these groups made outside of Terraform

locals {
  okta_inherited_groups_csv = templatefile("${path.module}/groups_inherited_okta.csv", {
    okta_admin_super_admin_group_id                          = okta_group.terraform_assigned_groups["okta_admin_super_admin"].id,
    okta_admin_super_admin_service_accounts_group_id         = okta_group.terraform_assigned_groups["okta_admin_super_admin_service_accounts"].id,
    okta_admin_it_support_lead_group_id                      = okta_group.terraform_assigned_groups["okta_admin_it_support_lead"].id,
    okta_admin_it_group_id                                   = okta_group.terraform_assigned_groups["okta_admin_it"].id,
    okta_admin_prod_support_group_id                         = okta_group.terraform_assigned_groups["okta_admin_prod_support"].id,
    okta_admin_it_msp_group_id                               = okta_group.terraform_assigned_groups["okta_admin_it_msp"].id,
    okta_admin_read_only_group_id                            = okta_group.terraform_assigned_groups["okta_admin_read_only"].id,
    okta_admin_read_only_service_accounts_group_id           = okta_group.terraform_assigned_groups["okta_admin_read_only_service_accounts"].id,
    okta_onboarding_username_generation_in_progress_group_id = okta_group.okta_assigned_groups["okta_onboarding_username_generation_in_progress"].id,
    okta_onboarding_username_confirmed_group_id              = okta_group.okta_assigned_groups["okta_onboarding_username_confirmed"].id,
    zoom_admin_basic_group_id                                = okta_group.okta_assigned_groups["zoom_admin_basic"].id,
    zoom_admin_concurrent_group_id                           = okta_group.okta_assigned_groups["zoom_admin_concurrent"].id,
    zoom_admin_concurrent_webinar_group_id                   = okta_group.okta_assigned_groups["zoom_admin_concurrent_webinar"].id,
    zoom_admin_pro_group_id                                  = okta_group.okta_assigned_groups["zoom_admin_pro"].id,
    zoom_admin_webinar_group_id                              = okta_group.okta_assigned_groups["zoom_admin_webinar"].id,
    zoom_member_concurrent_group_id                          = okta_group.okta_assigned_groups["zoom_member_concurrent"].id,
    zoom_member_concurrent_webinar_group_id                  = okta_group.okta_assigned_groups["zoom_member_concurrent_webinar"].id,
    zoom_member_pro_group_id                                 = okta_group.okta_assigned_groups["zoom_member_pro"].id,
    zoom_member_webinar_group_id                             = okta_group.okta_assigned_groups["zoom_member_webinar"].id,
    type_human_group_id                                      = okta_group.hr_inherited_groups["type_human"].id,
  })
  okta_inherited_groups = csvdecode(local.okta_inherited_groups_csv)
}

resource "okta_group" "okta_inherited_groups" {
  for_each = { for group in local.okta_inherited_groups : group.local_id => group }

  name        = each.value.group_name
  description = each.value.group_description

  lifecycle {
    ignore_changes = [users]
  }
}

resource "okta_group_rule" "okta_inherited_groups_rules" {
  for_each = { for group in local.okta_inherited_groups : group.local_id => group }

  name                  = each.value.group_membership_rule_name
  status                = "ACTIVE"
  remove_assigned_users = false
  expression_type       = "urn:okta:expression:1.0"
  expression_value      = each.value.group_membership_rule
  group_assignments = [
    okta_group.okta_inherited_groups[each.key].id,
  ]
}

# ------------------------------------------------------------------------------------------
# Groups with memberships based exclusively on official HR data
# These groups are populated by Okta group rules
# Terraform will IGNORE membership changes in these groups made outside of Terraform

locals {
  hr_inherited_groups_csv = templatefile("${path.module}/groups_inherited_hr.csv", {
    okta_onboarding_username_confirmed_group_id = okta_group.okta_assigned_groups["okta_onboarding_username_confirmed"].id,
    zero_touch_group_id                         = okta_group.okta_assigned_groups["zero_touch"].id,
  })
  hr_inherited_groups = csvdecode(local.hr_inherited_groups_csv)
}

resource "okta_group" "hr_inherited_groups" {
  for_each = { for group in local.hr_inherited_groups : group.local_id => group }

  name        = each.value.group_name
  description = each.value.group_description

  lifecycle {
    ignore_changes = [users]
  }
}

resource "okta_group_rule" "hr_inherited_groups_rules" {
  for_each = { for group in local.hr_inherited_groups : group.local_id => group }

  name                  = each.value.group_membership_rule_name
  status                = "ACTIVE"
  remove_assigned_users = false
  expression_type       = "urn:okta:expression:1.0"
  expression_value      = each.value.group_membership_rule
  group_assignments = [
    okta_group.hr_inherited_groups[each.key].id,
  ]
}

# ------------------------------------------------------------------------------------------
# Groups with memberships that directly assign apps, app roles, and/or okta policies
# These groups are populated manually in Okta and/or via identity governance
# Terraform will IGNORE membership changes in these groups made outside of Terraform

locals {
  okta_assigned_groups_csv = file("${path.module}/groups_assigned_okta.csv")
  okta_assigned_groups     = csvdecode(local.okta_assigned_groups_csv)
}

resource "okta_group" "okta_assigned_groups" {
  for_each = { for group in local.okta_assigned_groups : group.local_id => group }

  name        = each.value.group_name
  description = each.value.group_description

  lifecycle {
    ignore_changes = [users]
  }
}

# ------------------------------------------------------------------------------------------
# Group membership rules that populate other Okta groups
# These groups are populated manually in Okta and/or via identity governance
# Terraform will IGNORE membership changes in these groups made outside of Terraform

resource "okta_group_rule" "aws_meta_role_data_science" {
  name                  = "AWS Meta-Role - Data-Science"
  status                = "ACTIVE"
  remove_assigned_users = false
  expression_type       = "urn:okta:expression:1.0"
  expression_value      = "isMemberOfAnyGroup(\"${okta_group.okta_assigned_groups["aws_meta_role_data_science"].id}\")"
  group_assignments = [
    okta_group.okta_assigned_groups["aws_analytics_developer"].id,
    okta_group.okta_assigned_groups["aws_development_developer"].id,
    okta_group.okta_assigned_groups["aws_match_engine_production_developer"].id,
    okta_group.okta_assigned_groups["aws_match_engine_uat_developer"].id,
  ]
}

resource "okta_group_rule" "aws_meta_role_data_science_prod" {
  name                  = "AWS Meta-Role - Data-Science-Prod"
  status                = "ACTIVE"
  remove_assigned_users = false
  expression_type       = "urn:okta:expression:1.0"
  expression_value      = "isMemberOfAnyGroup(\"${okta_group.okta_assigned_groups["aws_meta_role_data_science_prod"].id}\")"
  group_assignments = [
    okta_group.okta_assigned_groups["aws_analytics_developer"].id,
    okta_group.okta_assigned_groups["aws_development_developer"].id,
    okta_group.okta_assigned_groups["aws_match_engine_production_developer"].id,
    okta_group.okta_assigned_groups["aws_match_engine_uat_developer"].id,
  ]
}

resource "okta_group_rule" "aws_meta_role_developer_default" {
  name                  = "AWS Meta-Role - Developer-Default"
  status                = "ACTIVE"
  remove_assigned_users = false
  expression_type       = "urn:okta:expression:1.0"
  expression_value      = "isMemberOfAnyGroup(\"${okta_group.okta_assigned_groups["aws_meta_role_developer_default"].id}\")"
  group_assignments = [
    okta_group.okta_assigned_groups["aws_analytics_dev_bronze_claims_orchestrator_redshift"].id,
    okta_group.okta_assigned_groups["aws_analytics_dev_developer"].id,
    okta_group.okta_assigned_groups["aws_analytics_developer"].id,
    okta_group.okta_assigned_groups["aws_analytics_uat_bronze_claims_orchestrator_redshift"].id,
    okta_group.okta_assigned_groups["aws_analytics_uat_developer"].id,
    okta_group.okta_assigned_groups["aws_ci_developer"].id,
    okta_group.okta_assigned_groups["aws_ci_marley_service"].id,
    okta_group.okta_assigned_groups["aws_development_developer"].id,
    okta_group.okta_assigned_groups["aws_development_marley_service"].id,
    okta_group.okta_assigned_groups["aws_match_engine_uat_developer"].id,
    okta_group.okta_assigned_groups["aws_platform_dev_developer"].id,
    okta_group.okta_assigned_groups["aws_qa_developer"].id,
    okta_group.okta_assigned_groups["aws_qa_marley_service"].id,
    okta_group.okta_assigned_groups["aws_uat_marley_service"].id,
  ]
}

resource "okta_group_rule" "aws_meta_role_developer_platform_cadet" {
  name                  = "AWS Meta-Role - Developer-Platform-Cadet"
  status                = "ACTIVE"
  remove_assigned_users = false
  expression_type       = "urn:okta:expression:1.0"
  expression_value      = "isMemberOfAnyGroup(\"${okta_group.okta_assigned_groups["aws_meta_role_developer_platform_cadet"].id}\")"
  group_assignments = [
    okta_group.okta_assigned_groups["aws_analytics_platform"].id,
    okta_group.okta_assigned_groups["aws_analytics_dev_platform"].id,
    okta_group.okta_assigned_groups["aws_analytics_uat_platform"].id,
    okta_group.okta_assigned_groups["aws_ci_marley_service"].id,
    okta_group.okta_assigned_groups["aws_ci_platform"].id,
    okta_group.okta_assigned_groups["aws_development_marley_service"].id,
    okta_group.okta_assigned_groups["aws_development_platform"].id,
    okta_group.okta_assigned_groups["aws_integration3_platform"].id,
    okta_group.okta_assigned_groups["aws_match_engine_uat_platform"].id,
    okta_group.okta_assigned_groups["aws_platform_dev_platform"].id,
    okta_group.okta_assigned_groups["aws_qa_marley_service"].id,
    okta_group.okta_assigned_groups["aws_qa_platform"].id,
    okta_group.okta_assigned_groups["aws_uat_marley_service"].id,
    okta_group.okta_assigned_groups["aws_uat_platform"].id,
  ]
}

resource "okta_group_rule" "aws_meta_role_developer_platform_infra" {
  name                  = "AWS Meta-Role - Developer-Platform-Infra"
  status                = "ACTIVE"
  remove_assigned_users = false
  expression_type       = "urn:okta:expression:1.0"
  expression_value      = "isMemberOfAnyGroup(\"${okta_group.okta_assigned_groups["aws_meta_role_developer_platform_infra"].id}\")"
  group_assignments = [
    okta_group.okta_assigned_groups["aws_analytics_platform"].id,
    okta_group.okta_assigned_groups["aws_analytics_dev_platform"].id,
    okta_group.okta_assigned_groups["aws_analytics_production_platform"].id,
    okta_group.okta_assigned_groups["aws_analytics_uat_platform"].id,
    okta_group.okta_assigned_groups["aws_ci_marley_service"].id,
    okta_group.okta_assigned_groups["aws_ci_platform"].id,
    okta_group.okta_assigned_groups["aws_development_marley_service"].id,
    okta_group.okta_assigned_groups["aws_development_platform"].id,
    okta_group.okta_assigned_groups["aws_hq_platform"].id,
    okta_group.okta_assigned_groups["aws_integration3_platform"].id,
    okta_group.okta_assigned_groups["aws_match_engine_production_platform"].id,
    okta_group.okta_assigned_groups["aws_match_engine_uat_platform"].id,
    okta_group.okta_assigned_groups["aws_operations_platform"].id,
    okta_group.okta_assigned_groups["aws_platform_dev_platform"].id,
    okta_group.okta_assigned_groups["aws_production_platform"].id,
    okta_group.okta_assigned_groups["aws_qa_marley_service"].id,
    okta_group.okta_assigned_groups["aws_qa_platform"].id,
    okta_group.okta_assigned_groups["aws_uat_marley_service"].id,
    okta_group.okta_assigned_groups["aws_uat_platform"].id,
  ]
}

resource "okta_group_rule" "aws_meta_role_developer_production" {
  name                  = "AWS Meta-Role - Developer-Production"
  status                = "ACTIVE"
  remove_assigned_users = false
  expression_type       = "urn:okta:expression:1.0"
  expression_value      = "isMemberOfAnyGroup(\"${okta_group.okta_assigned_groups["aws_meta_role_developer_production"].id}\")"
  group_assignments = [
    okta_group.okta_assigned_groups["aws_analytics_dev_bronze_claims_orchestrator_redshift"].id,
    okta_group.okta_assigned_groups["aws_analytics_dev_developer"].id,
    okta_group.okta_assigned_groups["aws_analytics_developer"].id,
    okta_group.okta_assigned_groups["aws_analytics_production_bronze_claims_orchestrator_redshift"].id,
    okta_group.okta_assigned_groups["aws_analytics_production_developer"].id,
    okta_group.okta_assigned_groups["aws_analytics_uat_bronze_claims_orchestrator_redshift"].id,
    okta_group.okta_assigned_groups["aws_analytics_uat_developer"].id,
    okta_group.okta_assigned_groups["aws_ci_developer"].id,
    okta_group.okta_assigned_groups["aws_ci_marley_service"].id,
    okta_group.okta_assigned_groups["aws_development_developer"].id,
    okta_group.okta_assigned_groups["aws_development_marley_service"].id,
    okta_group.okta_assigned_groups["aws_match_engine_production_developer"].id,
    okta_group.okta_assigned_groups["aws_match_engine_uat_developer"].id,
    okta_group.okta_assigned_groups["aws_platform_dev_developer"].id,
    okta_group.okta_assigned_groups["aws_qa_developer"].id,
    okta_group.okta_assigned_groups["aws_qa_marley_service"].id,
    okta_group.okta_assigned_groups["aws_uat_marley_service"].id,
  ]
}

resource "okta_group_rule" "aws_meta_role_solutions" {
  name                  = "AWS Meta-Role - Solutions"
  status                = "ACTIVE"
  remove_assigned_users = false
  expression_type       = "urn:okta:expression:1.0"
  expression_value      = "isMemberOfAnyGroup(\"${okta_group.okta_assigned_groups["aws_meta_role_solutions"].id}\")"
  group_assignments = [
    okta_group.okta_assigned_groups["aws_analytics_production_solutions"].id,
    okta_group.okta_assigned_groups["aws_analytics_uat_solutions"].id,
    okta_group.okta_assigned_groups["aws_development_solutions"].id,
    okta_group.okta_assigned_groups["aws_production_solutions"].id,
    okta_group.okta_assigned_groups["aws_uat_solutions"].id,
  ]
}

# ------------------------------------------------------------------------------------------
# Groups used for granting access to IH SSO services. See ih_sso_applications.tf for more
# details of how these groups are tied to services (and for the definitions of the variables
# used below).

resource "okta_group" "ih_sso_group" {
  for_each    = local.ih_sso_roles
  name        = "${local.ih_sso_group_name_prefix}${each.value}"
  description = "Group for SSO access to services requiring the ${each.key} role."
}
