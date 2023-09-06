locals {
  org_url = "https://includedhealth.okta.com"
}

locals {
  groups = merge(
    { for group in local.terraform_assigned_groups : group.local_id => { "id" : okta_group.terraform_assigned_groups[group.local_id].id, "url" : format("%s/api/v1/groups/%s", local.org_url, okta_group.terraform_assigned_groups[group.local_id].id) } },
    { for group in local.okta_inherited_groups : group.local_id => { "id" : okta_group.okta_inherited_groups[group.local_id].id, "url" : format("%s/api/v1/groups/%s", local.org_url, okta_group.okta_inherited_groups[group.local_id].id) } },
    { for group in local.hr_inherited_groups : group.local_id => { "id" : okta_group.hr_inherited_groups[group.local_id].id, "url" : format("%s/api/v1/groups/%s", local.org_url, okta_group.hr_inherited_groups[group.local_id].id) } },
    { for group in local.okta_assigned_groups : group.local_id => { "id" : okta_group.okta_assigned_groups[group.local_id].id, "url" : format("%s/api/v1/groups/%s", local.org_url, okta_group.okta_assigned_groups[group.local_id].id) } },
  { for group in okta_group.ih_sso_group : group.name => { "id" : group.id, "url" : format("%s/api/v1/groups/%s", local.org_url, group.id) } })
}


locals {
  service_accounts = merge(
    { for service_account in local.service_accounts_no_okta_admin : service_account.local_id => { "id" : okta_user.service_accounts_no_okta_admin[service_account.local_id].id, "url" : format("%s/api/v1/users/%s", local.org_url, okta_user.service_accounts_no_okta_admin[service_account.local_id].id) } },
    { for service_account in local.read_only_service_accounts : service_account.local_id => { "id" : okta_user.service_accounts_read_only_okta_admin[service_account.local_id].id, "url" : format("%s/api/v1/users/%s", local.org_url, okta_user.service_accounts_read_only_okta_admin[service_account.local_id].id) } },
    { for service_account in local.super_admin_service_accounts : service_account.local_id => { "id" : okta_user.service_accounts_okta_super_admin[service_account.local_id].id, "url" : format("%s/api/v1/users/%s", local.org_url, okta_user.service_accounts_okta_super_admin[service_account.local_id].id) } }
  )
  service_account_list = keys(local.service_accounts)
}

locals {
  it_excluded_groups = [
    "box_admin",
    "carbon_black_super_admin",
    "carbon_black_system_admin",
    "google_workspace_super_admin",
    "google_workspace_vault_admin",
    "instabug_owner",
    "palo_alto_networks_panorama_superuser",
    "salesforce_marketing_cloud_administrator",
    "salesforce_sales_cloud_system_administrator",
    "adobe_administrator",
    "apiiro_admin",
    "aws_analytics_developer",
    "aws_analytics_dev_developer",
    "aws_analytics_production_developer",
    "aws_analytics_uat_developer",
    "aws_ci_developer",
    "aws_development_developer",
    "aws_integration3_developer",
    "aws_integration3_offshore-platform",
    "aws_match_engine_production_developer",
    "aws_match_engine_uat_developer",
    "aws_operations_developer",
    "aws_platform_dev_developer",
    "aws_production_developer",
    "aws_qa_developer",
    "aws_uat_developer",
    "aws_uat_offshore-platform",
    "aws_integration3_cost-modeler",
    "aws_uat_cost-modeler",
    "aws_production_cost-modeler",
    "aws_operations_cost-modeler",
    "dispatch_health_admin",
    "github_it_infra_member",
    "github_it_infra_owner",
    "jamf_connect_fixtures",
    "jamf_connect_it_admin",
    "jamf_connect_records_room",
    "jamf_connect_standard",
    "jamf_pro_admin",
    "keeper_super_admin_role",
    "keeper_folder_it_infrastructure_engineering",
    "keeper_folder_it_systems_engineering",
    "linksquares_user",
    "o2o_gr_production_uar",
    "okta_access_requests",
    "okta_access_requests_default_assignee",
    "oomnitza_super_administrator",
    "orca_administrator",
    "pagerduty_account_owner",
    "palo_alto_networks_panorama_panorama_administrator",
    "ringcentral_super_admin",
    "securew2_admin",
    "slack_connect_roles_admin",
    "slack_connect_users_admin",
    "slack_dev_eng_roles_admin",
    "slack_dev_eng_users_admin",
    "slack_epdd_roles_admin",
    "slack_epdd_users_admin",
    "slack_ih_roles_admin",
    "slack_ih_users_admin",
    "slack_org_channels_admin",
    "slack_org_compliance_admin",
    "slack_org_roles_admin",
    "slack_org_users_admin",
    "terraform_cloud",
    "terraform_cloud_owner",
    "temp_employee_confluence",
  ]
  it_managed_groups = setsubtract(concat([for group in local.okta_assigned_groups : group.local_id], [for group in okta_group.ih_sso_group : group.name]), local.it_excluded_groups)
}