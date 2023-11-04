# ------------------------------------------------------------------------------------------
# Read-Only Okta Admins
locals {
 human_okta_read_only_admin_users = toset([

 local.okta_users["joe.willis,goesef@gmail.com"].id,

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
# ------------------------------------------------------------------------------------------# ------------------------------------------------------------------------------------------
# IT MSP Okta Admins

locals {
 human_okta_read_only_admin_users = toset([

 local.okta_users["joe.willis,goesef@gmail.com"].id,

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
 group_id = okta_group.terraform_assigned_groups["okta_admin_it_msp"].id
 role_type = "HELP_DESK_ADMIN"
 target_group_list = [
 okta_group.okta_inherited_groups["all_non_admins"].id,
 okta_group.terraform_assigned_groups["okta_admin_it_msp"].id,
 ]
}
resource "okta_group_role" "okta_admin_it_msp_read_only" {
 group_id = okta_group.terraform_assigned_groups["okta_admin_it_msp"].id
 role_type = "READ_ONLY_ADMIN"
}

# ------------------------------------------------------------------------------------------# ------------------------------------------------------------------------------------------
# Product Support Okta Admins

locals {
human_okta_prod_support_admin_users = toset([

 local.okta_users["joe.willis,goesef@gmail.com"].id,

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
group_id = okta_group.terraform_assigned_groups["okta_admin_prod_support"].id
role_type = "GROUP_MEMBERSHIP_ADMIN"
target_group_list = [
]
}
resource "okta_group_role" "okta_admin_prod_support_help_desk" {
group_id = okta_group.terraform_assigned_groups["okta_admin_prod_support"].id
role_type = "HELP_DESK_ADMIN"
target_group_list = [
okta_group.okta_inherited_groups["all_non_admins"].id,
okta_group.terraform_assigned_groups["okta_admin_prod_support"].id,
]
}
resource "okta_group_role" "okta_admin_prod_support_read_only" {
group_id = okta_group.terraform_assigned_groups["okta_admin_prod_support"].id
role_type = "READ_ONLY_ADMIN"
}
# ------------------------------------------------------------------------------------------# ------------------------------------------------------------------------------------------
# IT Support Lead Okta Admins

locals {
 human_okta_read_only_admin_users = toset([

 local.okta_users["joe.willis,goesef@gmail.com"].id,

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
 group_id = okta_group.terraform_assigned_groups["okta_admin_it_support_lead"].id
 role_type = "GROUP_MEMBERSHIP_ADMIN"
 target_group_list = [
 okta_group.okta_assigned_groups["okta_onboarding_username_confirmed"].id,
 okta_group.okta_assigned_groups["okta_sign_on_allow_mobile_access"].id,
 ]
}

# ------------------------------------------------------------------------------------------# ------------------------------------------------------------------------------------------
# IT Okta Admins

locals {
 human_okta_it_admin_users = toset([

 local.okta_users["joe.willis,goesef@gmail.com"].id,

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
 group_id = okta_group.terraform_assigned_groups["okta_admin_it"].id
 role_type = "GROUP_MEMBERSHIP_ADMIN"
 target_group_list = [
 okta_group.okta_assigned_groups["abnormal_security"].id,
 okta_group.okta_assigned_groups["abnormal_security_portal_global_admin"].id,
 okta_group.okta_assigned_groups["abnormal_security_portal_global_per_product_admin"].id,
 okta_group.okta_assigned_groups["abnormal_security_portal_tenant_admin"].id,
 okta_group.okta_assigned_groups["abnormal_security_portal_tenant_per_product_admin"].id,
 okta_group.okta_assigned_groups["adobe_acrobat_pro"].id,
 okta_group.okta_assigned_groups["adobe_captivate"].id,
 okta_group.okta_assigned_groups["adobe_creative_cloud_all_apps_pro"].id,
 okta_group.okta_assigned_groups["adobe_sign"].id,
 okta_group.okta_assigned_groups["aerohive"].id,
 okta_group.okta_assigned_groups["aetna_strategic_desktop"].id,
 okta_group.okta_assigned_groups["airtable_user"].id,
 okta_group.okta_assigned_groups["amazon_business_users"].id,
 okta_group.okta_assigned_groups["amazon_workspaces_oregon"].id,
 okta_group.okta_assigned_groups["amazon_workspaces_virginia"].id,
 okta_group.okta_assigned_groups["ambra_dicom_grid"].id,
 okta_group.okta_assigned_groups["ambra_dicom_grid_adminstrator"].id,
 okta_group.okta_assigned_groups["ambra_dicom_grid_care_coordinator_opinion_coordinator"].id,
 okta_group.okta_assigned_groups["ambra_dicom_grid_connected_care_program"].id,
 okta_group.okta_assigned_groups["ambra_dicom_grid_record_specialist"].id,
 okta_group.okta_assigned_groups["ambra_dicom_grid_record_specialist_2"].id,
 okta_group.okta_assigned_groups["ambra_dicom_grid_record_specialist_manager"].id,
 okta_group.okta_assigned_groups["amplitude_admin"].id,
 okta_group.okta_assigned_groups["amplitude_manager"].id,
 okta_group.okta_assigned_groups["amplitude_member"].id,
 okta_group.okta_assigned_groups["amplitude_viewer"].id,
 okta_group.okta_assigned_groups["anaplan_accounting"].id,
 okta_group.okta_assigned_groups["anaplan_cc_owner"].id,
 okta_group.okta_assigned_groups["anaplan_demand_planning"].id,
 okta_group.okta_assigned_groups["anaplan_fpa_cor"].id,
 okta_group.okta_assigned_groups["anaplan_fpa_opex"].id,
 okta_group.okta_assigned_groups["anaplan_fpa_revenue"].id,
 okta_group.okta_assigned_groups["anaplan_recruiting"].id,
 okta_group.okta_assigned_groups["anaplan_recruiting_ops"].id,
 okta_group.okta_assigned_groups["anaplan_sales_ops"].id,
 okta_group.okta_assigned_groups["anaplan_vp_fpa"].id,
 okta_group.okta_assigned_groups["anomalo_production_admin"].id,
 okta_group.okta_assigned_groups["anomalo_production_editor"].id,
 okta_group.okta_assigned_groups["anomalo_production_viewer"].id,
 okta_group.okta_assigned_groups["anomalo_uat_admin"].id,
 okta_group.okta_assigned_groups["apiiro_security_engineer"].id,
 okta_group.okta_assigned_groups["apple_developer_account_access_to_reports"].id,
 okta_group.okta_assigned_groups["apple_developer_account_admin"].id,
 okta_group.okta_assigned_groups["apple_developer_account_app_manager"].id,
 okta_group.okta_assigned_groups["apple_developer_account_customer_support"].id,
 okta_group.okta_assigned_groups["apple_developer_account_developer"].id,
 okta_group.okta_assigned_groups["apple_developer_account_finance"].id,
 okta_group.okta_assigned_groups["apple_developer_account_marketing"].id,
 okta_group.okta_assigned_groups["articulate360_user"].id,
 okta_group.okta_assigned_groups["aruba_admin"].id,
 okta_group.okta_assigned_groups["aruba_read_only"].id,
 okta_group.okta_assigned_groups["asana"].id,
 okta_group.okta_assigned_groups["asana_admin"].id,
 okta_group.okta_assigned_groups["athenahealth_clienttrain"].id,
 okta_group.okta_assigned_groups["athenahealth_preview"].id,
 okta_group.okta_assigned_groups["athenahealth_production"].id,
 okta_group.okta_assigned_groups["atlassian_confluence_user"].id,
 okta_group.okta_assigned_groups["atlassian_jira_user"].id,
 okta_group.okta_assigned_groups["atlassian_jsm_user"].id,
 okta_group.okta_assigned_groups["auth0-prod_admin"].id,
 okta_group.okta_assigned_groups["auth0_prod"].id,
 okta_group.okta_assigned_groups["availity"].id,
 okta_group.okta_assigned_groups["aws_analytics_dev"].id,
 okta_group.okta_assigned_groups["aws_analytics_infosec"].id,
 okta_group.okta_assigned_groups["aws_analytics_platform"].id,
 okta_group.okta_assigned_groups["aws_analytics_provisioner"].id,
 okta_group.okta_assigned_groups["aws_analytics_read_only"].id,
 okta_group.okta_assigned_groups["aws_analytics_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_analytics_dev_athena"].id,
 okta_group.okta_assigned_groups["aws_analytics_dev_bronze_claims_orchestrator_redshift"].id,
 okta_group.okta_assigned_groups["aws_analytics-dev_dev"].id,
 okta_group.okta_assigned_groups["aws_analytics_dev_infosec"].id,
 okta_group.okta_assigned_groups["aws_analytics_dev_platform"].id,
 okta_group.okta_assigned_groups["aws_analytics_dev_provisioner"].id,
 okta_group.okta_assigned_groups["aws_analytics_dev_read_only"].id,
 okta_group.okta_assigned_groups["aws_analytics_dev_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_analytics_production_athena"].id,
 okta_group.okta_assigned_groups["aws_analytics_production_bronze_claims_orchestrator_redshift"].id,
 okta_group.okta_assigned_groups["aws_analytics-production_dev"].id,
 okta_group.okta_assigned_groups["aws_analytics_production_infosec"].id,
 okta_group.okta_assigned_groups["aws_analytics_production_platform"].id,
 okta_group.okta_assigned_groups["aws_analytics_production_provisioner"].id,
 okta_group.okta_assigned_groups["aws_analytics_production_read_only"].id,
 okta_group.okta_assigned_groups["aws_analytics_production_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_analytics_production_solutions"].id,
 okta_group.okta_assigned_groups["aws_analytics_uat_athena"].id,
 okta_group.okta_assigned_groups["aws_analytics_uat_bronze_claims_orchestrator_redshift"].id,
 okta_group.okta_assigned_groups["aws_analytics-uat_dev"].id,
 okta_group.okta_assigned_groups["aws_analytics_uat_infosec"].id,
 okta_group.okta_assigned_groups["aws_analytics_uat_platform"].id,
 okta_group.okta_assigned_groups["aws_analytics_uat_provisioner"].id,
 okta_group.okta_assigned_groups["aws_analytics_uat_read_only"].id,
 okta_group.okta_assigned_groups["aws_analytics_uat_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_analytics_uat_solutions"].id,
 okta_group.okta_assigned_groups["aws_ci_dev"].id,
 okta_group.okta_assigned_groups["aws_ci_infosec"].id,
 okta_group.okta_assigned_groups["aws_ci_marley_service"].id,
 okta_group.okta_assigned_groups["aws_ci_platform"].id,
 okta_group.okta_assigned_groups["aws_ci_provisioner"].id,
 okta_group.okta_assigned_groups["aws_ci_read_only"].id,
 okta_group.okta_assigned_groups["aws_ci_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_development_dev"].id,
 okta_group.okta_assigned_groups["aws_development_infosec"].id,
 okta_group.okta_assigned_groups["aws_development_marley_service"].id,
 okta_group.okta_assigned_groups["aws_development_platform"].id,
 okta_group.okta_assigned_groups["aws_development_provisioner"].id,
 okta_group.okta_assigned_groups["aws_development_read_only"].id,
 okta_group.okta_assigned_groups["aws_development_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_development_solutions"].id,
 okta_group.okta_assigned_groups["aws_hq_infosec"].id,
 okta_group.okta_assigned_groups["aws_hq_it_admin"].id,
 okta_group.okta_assigned_groups["aws_hq_it_msp_team"].id,
 okta_group.okta_assigned_groups["aws_hq_it_team"].id,
 okta_group.okta_assigned_groups["aws_hq_platform"].id,
 okta_group.okta_assigned_groups["aws_hq_prod_support_team"].id,
 okta_group.okta_assigned_groups["aws_hq_provisioner"].id,
 okta_group.okta_assigned_groups["aws_hq_read_only"].id,
 okta_group.okta_assigned_groups["aws_hq_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_integration3_dev"].id,
 okta_group.okta_assigned_groups["aws_integration3_infosec"].id,
 okta_group.okta_assigned_groups["aws_integration3_platform"].id,
 okta_group.okta_assigned_groups["aws_integration3_provisioner"].id,
 okta_group.okta_assigned_groups["aws_integration3_read_only"].id,
 okta_group.okta_assigned_groups["aws_integration3_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_match_engine_production_dev"].id,
 okta_group.okta_assigned_groups["aws_match_engine_production_infosec"].id,
 okta_group.okta_assigned_groups["aws_match_engine_production_platform"].id,
 okta_group.okta_assigned_groups["aws_match_engine_production_provisioner"].id,
 okta_group.okta_assigned_groups["aws_match_engine_production_read_only"].id,
 okta_group.okta_assigned_groups["aws_match_engine_production_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_match_engine_uat_dev"].id,
 okta_group.okta_assigned_groups["aws_match_engine_uat_infosec"].id,
 okta_group.okta_assigned_groups["aws_match_engine_uat_platform"].id,
 okta_group.okta_assigned_groups["aws_match_engine_uat_provisioner"].id,
 okta_group.okta_assigned_groups["aws_match_engine_uat_read_only"].id,
 okta_group.okta_assigned_groups["aws_match_engine_uat_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_meta_role_data_science"].id,
 okta_group.okta_assigned_groups["aws_meta_role_data_science_prod"].id,
 okta_group.okta_assigned_groups["aws_meta_role_developer_default"].id,
 okta_group.okta_assigned_groups["aws_meta_role_developer_platform_cadet"].id,
 okta_group.okta_assigned_groups["aws_meta_role_developer_platform_infrastructure"].id,
 okta_group.okta_assigned_groups["aws_meta_role_developer_platform_infra"].id,
 okta_group.okta_assigned_groups["aws_meta_role_developer_production"].id,
 okta_group.okta_assigned_groups["aws_meta_role_solutions"].id,
 okta_group.okta_assigned_groups["aws_operations_billing_read_only"].id,
 okta_group.okta_assigned_groups["aws_operations_dev"].id,
 okta_group.okta_assigned_groups["aws_operations_finance_billing"].id,
 okta_group.okta_assigned_groups["aws_operations_infosec"].id,
 okta_group.okta_assigned_groups["aws_operations_platform"].id,
 okta_group.okta_assigned_groups["aws_operations_provisioner"].id,
 okta_group.okta_assigned_groups["aws_operations_read_only"].id,
 okta_group.okta_assigned_groups["aws_operations_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_operations_sso_admin"].id,
 okta_group.okta_assigned_groups["aws_platform_dev_infosec"].id,
 okta_group.okta_assigned_groups["aws_platform_dev_platform"].id,
 okta_group.okta_assigned_groups["aws_platform_dev_provisioner"].id,
 okta_group.okta_assigned_groups["aws_platform_dev_read_only"].id,
 okta_group.okta_assigned_groups["aws_platform_dev_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_production_dev"].id,
 okta_group.okta_assigned_groups["aws_production_enduser_finance"].id,
 okta_group.okta_assigned_groups["aws_production_enduser_yellow"].id,
 okta_group.okta_assigned_groups["aws_production_infosec"].id,
 okta_group.okta_assigned_groups["aws_production_platform"].id,
 okta_group.okta_assigned_groups["aws_production_provisioner"].id,
 okta_group.okta_assigned_groups["aws_production_read_five9_call_backups"].id,
 okta_group.okta_assigned_groups["aws_production_read_only"].id,
 okta_group.okta_assigned_groups["aws_production_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_production_solutions"].id,
 okta_group.okta_assigned_groups["aws_production_enduser_red"].id,
 okta_group.okta_assigned_groups["aws_uat_enduser_red"].id,
 okta_group.okta_assigned_groups["aws_qa_infosec"].id,
 okta_group.okta_assigned_groups["aws_qa_marley_service"].id,
 okta_group.okta_assigned_groups["aws_qa_platform"].id,
 okta_group.okta_assigned_groups["aws_qa_provisioner"].id,
 okta_group.okta_assigned_groups["aws_qa_read_only"].id,
 okta_group.okta_assigned_groups["aws_qa_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_test_infosec"].id,
 okta_group.okta_assigned_groups["aws_test_platform"].id,
 okta_group.okta_assigned_groups["aws_test_provisioner"].id,
 okta_group.okta_assigned_groups["aws_test_read_only"].id,
 okta_group.okta_assigned_groups["aws_test_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_trufflehog_platform"].id,
 okta_group.okta_assigned_groups["aws_trufflehog_infosec"].id,
 okta_group.okta_assigned_groups["aws_orca_platform"].id,
 okta_group.okta_assigned_groups["aws_orca_infosec"].id,
 okta_group.okta_assigned_groups["aws_third_party_infosec"].id,
 okta_group.okta_assigned_groups["aws_third_party_platform"].id,
 okta_group.okta_assigned_groups["aws_third_party_provisioner"].id,
 okta_group.okta_assigned_groups["aws_third_party_read_only"].id,
 okta_group.okta_assigned_groups["aws_third_party_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_uat_dev"].id,
 okta_group.okta_assigned_groups["aws_uat_enduser_finance"].id,
 okta_group.okta_assigned_groups["aws_uat_enduser_yellow"].id,
 okta_group.okta_assigned_groups["aws_uat_infosec"].id,
 okta_group.okta_assigned_groups["aws_uat_marley_service"].id,
 okta_group.okta_assigned_groups["aws_uat_platform"].id,
 okta_group.okta_assigned_groups["aws_uat_provisioner"].id,
 okta_group.okta_assigned_groups["aws_uat_read_only"].id,
 okta_group.okta_assigned_groups["aws_uat_security_auditor"].id,
 okta_group.okta_assigned_groups["aws_uat_solutions"].id,
 okta_group.okta_assigned_groups["aws_vendor_poc_infosec"].id,
 okta_group.okta_assigned_groups["aws_vendor_poc_platform"].id,
 okta_group.okta_assigned_groups["aws_vendor_poc_provisioner"].id,
 okta_group.okta_assigned_groups["aws_vendor_poc_read_only"].id,
 okta_group.okta_assigned_groups["aws_vendor_poc_security_auditor"].id,
 okta_group.okta_assigned_groups["basecamp"].id,
 okta_group.okta_assigned_groups["box_admin"].id,
 okta_group.okta_assigned_groups["box_coadmin"].id,
 okta_group.okta_assigned_groups["box_user"].id,
 okta_group.okta_assigned_groups["brivo_admin"].id,
 okta_group.okta_assigned_groups["bugcrowd_admin"].id,
 okta_group.okta_assigned_groups["bugcrowd_analyst"].id,
 okta_group.okta_assigned_groups["bugcrowd_owner"].id,
 okta_group.okta_assigned_groups["bugcrowd_viewer"].id,
 okta_group.okta_assigned_groups["calendly"].id,
 okta_group.okta_assigned_groups["calendly_admin"].id,
 okta_group.okta_assigned_groups["carbon_black"].id,
 okta_group.okta_assigned_groups["carbon_black_admin_legacy"].id,
 okta_group.okta_assigned_groups["carbon_black_limited_admin"].id,
 okta_group.okta_assigned_groups["carbon_black_live_response_admin_legacy"].id,
 okta_group.okta_assigned_groups["carbon_black_super_admin"].id,
 okta_group.okta_assigned_groups["carbon_black_system_admin"].id,
 okta_group.okta_assigned_groups["ccadmin"].id,
 okta_group.okta_assigned_groups["cleanweb_design_administrator"].id,
 okta_group.okta_assigned_groups["cleanweb_design_author"].id,
 okta_group.okta_assigned_groups["cleanweb_design_contributor"].id,
 okta_group.okta_assigned_groups["cleanweb_design_editor"].id,
 okta_group.okta_assigned_groups["cleanweb_design_seo_editor"].id,
 okta_group.okta_assigned_groups["cleanweb_design_seo_manager"].id,
 okta_group.okta_assigned_groups["cleanweb_design_subscriber"].id,
 okta_group.okta_assigned_groups["cleartriage"].id,
 okta_group.okta_assigned_groups["clientsuccess"].id,
 okta_group.okta_assigned_groups["clientsuccess_admin"].id,
 okta_group.okta_assigned_groups["clientsuccess_executive"].id,
 okta_group.okta_assigned_groups["clientsuccess_manager"].id,
 okta_group.okta_assigned_groups["code_climate"].id,
 okta_group.okta_assigned_groups["concur_users"].id,
 okta_group.okta_assigned_groups["concord_fax"].id,
 okta_group.okta_assigned_groups["contentful_admin"].id,
 okta_group.okta_assigned_groups["contentful_developer"].id,
 okta_group.okta_assigned_groups["contentful_member"].id,
 okta_group.okta_assigned_groups["contentful_owner"].id,
 okta_group.okta_assigned_groups["cookiepro_assessments_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_auditor"].id,
 okta_group.okta_assigned_groups["cookiepro_audit_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_awareness_training_learner"].id,
 okta_group.okta_assigned_groups["cookiepro_awareness_training_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_consent_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_cookie_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_data_mapping_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_data_subject_requests_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_enterprise_policy_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_incidents_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_invited"].id,
 okta_group.okta_assigned_groups["cookiepro_it_risk_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_maturity_planning_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_onetrust_agent"].id,
 okta_group.okta_assigned_groups["cookiepro_policy_attestation_respondent"].id,
 okta_group.okta_assigned_groups["cookiepro_privacy_notice_author"].id,
 okta_group.okta_assigned_groups["cookiepro_privacy_notice_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_privacy_notice_viewer"].id,
 okta_group.okta_assigned_groups["cookiepro_privacy_officer"].id,
 okta_group.okta_assigned_groups["cookiepro_privacy_template_author"].id,
 okta_group.okta_assigned_groups["cookiepro_program_benchmarking_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_project_owner"].id,
 okta_group.okta_assigned_groups["cookiepro_project_respondent"].id,
 okta_group.okta_assigned_groups["cookiepro_project_viewer"].id,
 okta_group.okta_assigned_groups["cookiepro_site_admin"].id,
 okta_group.okta_assigned_groups["cookiepro_vendor_manager"].id,
 okta_group.okta_assigned_groups["cookiepro_whistleblower_case_assignee"].id,
 okta_group.okta_assigned_groups["cookiepro_whistleblower_manager"].id,
 okta_group.okta_assigned_groups["cvs_caremark_portal"].id,
 okta_group.okta_assigned_groups["dispatch_health_user"].id,
 okta_group.okta_assigned_groups["dmarcian"].id,
 okta_group.okta_assigned_groups["dmarcian_admin"].id,
 okta_group.okta_assigned_groups["docker"].id,
 okta_group.okta_assigned_groups["dscout_account_owner"].id,
 okta_group.okta_assigned_groups["dscout_member"].id,
 okta_group.okta_assigned_groups["dscout_viewer"].id,
 okta_group.okta_assigned_groups["ehealth"].id,
 okta_group.okta_assigned_groups["elevate_security"].id,
 okta_group.okta_assigned_groups["expressscripts"].id,
 okta_group.okta_assigned_groups["fedex"].id,
 okta_group.okta_assigned_groups["fedex_admin"].id,
 okta_group.okta_assigned_groups["fedex_reporting"].id,
 okta_group.okta_assigned_groups["figma"].id,
 okta_group.okta_assigned_groups["figma_editor"].id,
 okta_group.okta_assigned_groups["figma_viewer_restricted"].id,
 okta_group.okta_assigned_groups["figjam_editor"].id,
 okta_group.okta_assigned_groups["figjam_viewer_restricted"].id,
 okta_group.okta_assigned_groups["figma_figjam_editor"].id,
 okta_group.okta_assigned_groups["five9"].id,
 okta_group.okta_assigned_groups["five9_plus_adapter_for_salesforce"].id,
 okta_group.okta_assigned_groups["five9_reporting"].id,
 okta_group.okta_assigned_groups["five9_swa"].id,
 okta_group.okta_assigned_groups["fletch"].id,
 okta_group.okta_assigned_groups["fletch_admin"].id,
 okta_group.okta_assigned_groups["floyd_db"].id,
 okta_group.okta_assigned_groups["gcp_big_query_frankie"].id,
 okta_group.okta_assigned_groups["gcp_big_query_national_claims_warehouse"].id,
 okta_group.okta_assigned_groups["gcp_big_query_other"].id,
 okta_group.okta_assigned_groups["gcp_frankie_bigquery_admin"].id,
 okta_group.okta_assigned_groups["gcp_frankie_bigquery_data_editor"].id,
 okta_group.okta_assigned_groups["gcp_frankie_bigquery_job_user"].id,
 okta_group.okta_assigned_groups["gcp_frankie_bigquery_metadata_viewer"].id,
 okta_group.okta_assigned_groups["gcp_frankie_editor"].id,
 okta_group.okta_assigned_groups["gcp_frankie_owner"].id,
 okta_group.okta_assigned_groups["gcp_frankie_project_billing_manager"].id,
 okta_group.okta_assigned_groups["gcp_frankie_project_mover"].id,
 okta_group.okta_assigned_groups["gcp_frankie_storage_object_admin"].id,
 okta_group.okta_assigned_groups["gcp_frankie_storage_object_creator"].id,
 okta_group.okta_assigned_groups["gcp_frankie_storage_object_viewer"].id,
 okta_group.okta_assigned_groups["gcp_frankie_viewer"].id,
 okta_group.okta_assigned_groups["gcp_ncw_bigquery_admin"].id,
 okta_group.okta_assigned_groups["gcp_ncw_bigquery_data_editor"].id,
 okta_group.okta_assigned_groups["gcp_ncw_bigquery_data_viewer"].id,
 okta_group.okta_assigned_groups["gcp_ncw_bigquery_job_user"].id,
 okta_group.okta_assigned_groups["gcp_ncw_bigquery_user"].id,
 okta_group.okta_assigned_groups["gcp_ncw_cloud_build_service_account"].id,
 okta_group.okta_assigned_groups["gcp_ncw_editor"].id,
 okta_group.okta_assigned_groups["gcp_ncw_owner"].id,
 okta_group.okta_assigned_groups["gcp_ncw_project_billing_manager"].id,
 okta_group.okta_assigned_groups["gcp_ncw_project_mover"].id,
 okta_group.okta_assigned_groups["gcp_ncw_security_reviewer"].id,
 okta_group.okta_assigned_groups["gcp_ncw_service_account_actor"].id,
 okta_group.okta_assigned_groups["gcp_ncw_storage_object_admin"].id,
 okta_group.okta_assigned_groups["gcp_ncw_storage_object_creator"].id,
 okta_group.okta_assigned_groups["gcp_ncw_storage_object_viewer"].id,
 okta_group.okta_assigned_groups["gcp_ncw_viewer"].id,
 okta_group.okta_assigned_groups["github_consultingmd_owner"].id,
 okta_group.okta_assigned_groups["github_doctor_on_demand_owner"].id,
 okta_group.okta_assigned_groups["github_member"].id,
 okta_group.okta_assigned_groups["github_owner"].id,
 okta_group.okta_assigned_groups["google_ads"].id,
 okta_group.okta_assigned_groups["google_ads_admin"].id,
 okta_group.okta_assigned_groups["google_ads_billing"].id,
 okta_group.okta_assigned_groups["google_ads_email_only"].id,
 okta_group.okta_assigned_groups["google_ads_read_only"].id,
 okta_group.okta_assigned_groups["google_analytics_collaborate"].id,
 okta_group.okta_assigned_groups["google_analytics_edit"].id,
 okta_group.okta_assigned_groups["google_analytics_manage_users"].id,
 okta_group.okta_assigned_groups["google_analytics_read_analyze"].id,
 okta_group.okta_assigned_groups["google_analytics_read_analyze_gr_site_only"].id,
 okta_group.okta_assigned_groups["google_drive_athena_emr_archive_content_manager"].id,
 okta_group.okta_assigned_groups["google_drive_athena_emr_archive_contributor"].id,
 okta_group.okta_assigned_groups["google_drive_athena_emr_archive_viewer"].id,
 okta_group.okta_assigned_groups["google_playstore_console"].id,
 okta_group.okta_assigned_groups["google_tag_manager_approve"].id,
 okta_group.okta_assigned_groups["google_tag_manager_edit"].id,
 okta_group.okta_assigned_groups["google_tag_manager_publish"].id,
 okta_group.okta_assigned_groups["google_tag_manager_read"].id,
 okta_group.okta_assigned_groups["google_workspace"].id,
 okta_group.okta_assigned_groups["google_workspace_it_admin"].id,
 okta_group.okta_assigned_groups["google_workspace_it_msp_admin"].id,
 okta_group.okta_assigned_groups["google_workspace_legal_team_admin"].id,
 okta_group.okta_assigned_groups["google_workspace_meet_hardware_admin"].id,
 okta_group.okta_assigned_groups["google_workspace_product_support_admin"].id,
 okta_group.okta_assigned_groups["google_workspace_security_team_admin"].id,
 okta_group.okta_assigned_groups["google_workspace_super_admin"].id,
 okta_group.okta_assigned_groups["google_workspace_vault_admin"].id,
 okta_group.okta_assigned_groups["grafana"].id,
 okta_group.okta_assigned_groups["grand_rounds"].id,
 okta_group.okta_assigned_groups["grand_rounds_hub"].id,
 okta_group.okta_assigned_groups["helpjuice_knowledge_enablement"].id,
 okta_group.okta_assigned_groups["helpjuice_super_admin"].id,
 okta_group.okta_assigned_groups["helpjuice_viewer"].id,
 okta_group.okta_assigned_groups["hireez_admin"].id,
 okta_group.okta_assigned_groups["hireez_collaborator"].id,
 okta_group.okta_assigned_groups["hireez_insights"].id,
 okta_group.okta_assigned_groups["hireez_recruiter"].id,
 okta_group.okta_assigned_groups["instabug_admin"].id,
 okta_group.okta_assigned_groups["instabug_member"].id,
 okta_group.okta_assigned_groups["instabug_owner"].id,
 okta_group.okta_assigned_groups["instabug_viewer"].id,
 okta_group.okta_assigned_groups["instapage_editor"].id,
 okta_group.okta_assigned_groups["instapage_manager"].id,
 okta_group.okta_assigned_groups["instapage_viewer"].id,
 okta_group.okta_assigned_groups["interseller_user"].id,
 okta_group.okta_assigned_groups["jenkins_admin"].id,
 okta_group.okta_assigned_groups["jenkins_developer"].id,
 okta_group.okta_assigned_groups["jenkins_release"].id,
 okta_group.okta_assigned_groups["jetbrains_software_all_products"].id,
 okta_group.okta_assigned_groups["jetbrains_software_datagrip"].id,
 okta_group.okta_assigned_groups["jetbrains_software_goland"].id,
 okta_group.okta_assigned_groups["jetbrains_software_intellij_idea_ultimate"].id,
 okta_group.okta_assigned_groups["jetbrains_software_pycharm"].id,
 okta_group.okta_assigned_groups["jetbrains_software_rubymine"].id,
 okta_group.okta_assigned_groups["jetbrains_software_webstorm"].id,
 okta_group.okta_assigned_groups["jira"].id,
 okta_group.okta_assigned_groups["jira_service_desk"].id,
 okta_group.okta_assigned_groups["keeper_admin_role_compliance"].id,
 okta_group.okta_assigned_groups["keeper_admin_role_it_support"].id,
 okta_group.okta_assigned_groups["keeper_admin_role_security_engineering"].id,
 okta_group.okta_assigned_groups["keeper_folder_copy_services"].id,
 okta_group.okta_assigned_groups["keeper_folder_image_services"].id,
 okta_group.okta_assigned_groups["keeper_folder_secure_messaging_services"].id,
 okta_group.okta_assigned_groups["keeper_folder_it_support"].id,
 okta_group.okta_assigned_groups["keeper_role_engineering_staff"].id,
 okta_group.okta_assigned_groups["keeper_role_executive_assistants"].id,
 okta_group.okta_assigned_groups["keeper_role_executive_staff"].id,
 okta_group.okta_assigned_groups["keeper_role_share_user"].id,
 okta_group.okta_assigned_groups["keeper_role_tech_support"].id,
 okta_group.okta_assigned_groups["keeper_role_user"].id,
 okta_group.okta_assigned_groups["kudos_care_team_leadership"].id,
 okta_group.okta_assigned_groups["kudos_manager"].id,
 okta_group.okta_assigned_groups["kudos_member"].id,
 okta_group.okta_assigned_groups["kudos_support_team"].id,
 okta_group.okta_assigned_groups["kudos_team_lead"].id,
 okta_group.okta_assigned_groups["lastpass_accounting_admin"].id,
 okta_group.okta_assigned_groups["lastpass_app_store_integration_read_only"].id,
 okta_group.okta_assigned_groups["lastpass_athenahealth_admin"].id,
 okta_group.okta_assigned_groups["lastpass_b2b_gtm"].id,
 okta_group.okta_assigned_groups["lastpass_claims"].id,
 okta_group.okta_assigned_groups["lastpass_engineering_control"].id,
 okta_group.okta_assigned_groups["lastpass_engineering_dr"].id,
 okta_group.okta_assigned_groups["lastpass_engineering_ds"].id,
 okta_group.okta_assigned_groups["lastpass_engineering_general"].id,
 okta_group.okta_assigned_groups["lastpass_engineering_general_read_only"].id,
 okta_group.okta_assigned_groups["lastpass_engineering_it_qa_system_creds_admin"].id,
 okta_group.okta_assigned_groups["lastpass_engineering_it_qa_system_creds_read_only"].id,
 okta_group.okta_assigned_groups["lastpass_engineering_mobile"].id,
 okta_group.okta_assigned_groups["lastpass_engineering_production"].id,
 okta_group.okta_assigned_groups["lastpass_executive_assistants"].id,
 okta_group.okta_assigned_groups["lastpass_hr_admin_read_only"].id,
 okta_group.okta_assigned_groups["lastpass_it_team"].id,
 okta_group.okta_assigned_groups["lastpass_kahoot_users"].id,
 okta_group.okta_assigned_groups["lastpass_marketing_zoom_access_read_only"].id,
 okta_group.okta_assigned_groups["lastpass_pagerduty_service_account_api_access"].id,
 okta_group.okta_assigned_groups["lastpass_pathology"].id,
 okta_group.okta_assigned_groups["lastpass_platform_complexes"].id,
 okta_group.okta_assigned_groups["lastpass_product_support"].id,
 okta_group.okta_assigned_groups["lastpass_product_support_manager"].id,
 okta_group.okta_assigned_groups["lastpass_qa"].id,
 okta_group.okta_assigned_groups["lastpass_records_administrative_specialists"].id,
 okta_group.okta_assigned_groups["lastpass_records_specialist_2s"].id,
 okta_group.okta_assigned_groups["lastpass_records_specialist_leads"].id,
 okta_group.okta_assigned_groups["lastpass_records_specialist_managers"].id,
 okta_group.okta_assigned_groups["lastpass_records_team_secure_messaging_read_only"].id,
 okta_group.okta_assigned_groups["lastpass_research_service_account_read_only"].id,
 okta_group.okta_assigned_groups["lastpass_senior_records_specialists"].id,
 okta_group.okta_assigned_groups["lastpass_sfmc_sftp_server_read_only"].id,
 okta_group.okta_assigned_groups["lastpass_siteground_admin"].id,
 okta_group.okta_assigned_groups["lastpass_siteground_read_only"].id,
 okta_group.okta_assigned_groups["lastpass_solutions_engineering"].id,
 okta_group.okta_assigned_groups["lastpass_stock_admin_read_only"].id,
 okta_group.okta_assigned_groups["lastpass_summit_team"].id,
 okta_group.okta_assigned_groups["lastpass_training_team"].id,
 okta_group.okta_assigned_groups["lastpass_umr_upload_download_users"].id,
 okta_group.okta_assigned_groups["lastpass_viva_transcription_access"].id,
 okta_group.okta_assigned_groups["launchdarkly_admin"].id,
 okta_group.okta_assigned_groups["launchdarkly_developer"].id,
 okta_group.okta_assigned_groups["launchdarkly_reader"].id,
 okta_group.okta_assigned_groups["launchdarkly_uat_developer"].id,
 okta_group.okta_assigned_groups["launchdarkly_vinsol"].id,
 okta_group.okta_assigned_groups["launchdarkly_writer"].id,
 okta_group.okta_assigned_groups["learnupon_admin"].id,
 okta_group.okta_assigned_groups["learnupon_instructor"].id,
 okta_group.okta_assigned_groups["learnupon_learner"].id,
 okta_group.okta_assigned_groups["learnupon_manager"].id,
 okta_group.okta_assigned_groups["lever"].id,
 okta_group.okta_assigned_groups["linkedin_analyst"].id,
 okta_group.okta_assigned_groups["linkedin_campaign_manager_account_manager"].id,
 okta_group.okta_assigned_groups["linkedin_campaign_manager_campaign_manager"].id,
 okta_group.okta_assigned_groups["linkedin_campaign_manager_creative_manager"].id,
 okta_group.okta_assigned_groups["linkedin_campaign_manager_viewer"].id,
 okta_group.okta_assigned_groups["linkedin_content_admin"].id,
 okta_group.okta_assigned_groups["linkedin_curator"].id,
 okta_group.okta_assigned_groups["linkedin_super_admin"].id,
 okta_group.okta_assigned_groups["linksquares_administrator"].id,
 okta_group.okta_assigned_groups["linksquares_manager"].id,
 okta_group.okta_assigned_groups["linksquares_read-only"].id,
 okta_group.okta_assigned_groups["lob"].id,
 okta_group.okta_assigned_groups["lob_admin"].id,
 okta_group.okta_assigned_groups["lob_read_write"].id,
 okta_group.okta_assigned_groups["logstore_integration3"].id,
 okta_group.okta_assigned_groups["logstore_integration3_us_west"].id,
 okta_group.okta_assigned_groups["logstore_platform_dev"].id,
 okta_group.okta_assigned_groups["logstore_production"].id,
 okta_group.okta_assigned_groups["logstore_production_us_west"].id,
 okta_group.okta_assigned_groups["logstore_uat"].id,
 okta_group.okta_assigned_groups["logstore_uat_us_west"].id,
 okta_group.okta_assigned_groups["looker_dev_admin"].id,
 okta_group.okta_assigned_groups["looker_dev_developer"].id,
 okta_group.okta_assigned_groups["looker_dev_financedeveloper"].id,
 okta_group.okta_assigned_groups["looker_dev_financeuser"].id,
 okta_group.okta_assigned_groups["looker_dev_redcatalogdeveloper"].id,
 okta_group.okta_assigned_groups["looker_dev_redcataloguser"].id,
 okta_group.okta_assigned_groups["looker_dev_reddeveloper"].id,
 okta_group.okta_assigned_groups["looker_dev_reduser"].id,
 okta_group.okta_assigned_groups["looker_dev_user"].id,
 okta_group.okta_assigned_groups["looker_dev_viewer"].id,
 okta_group.okta_assigned_groups["looker_prod_admin"].id,
 okta_group.okta_assigned_groups["looker_prod_developer"].id,
 okta_group.okta_assigned_groups["looker_prod_financedeveloper"].id,
 okta_group.okta_assigned_groups["looker_prod_financeuser"].id,
 okta_group.okta_assigned_groups["looker_prod_redcatalogdeveloper"].id,
 okta_group.okta_assigned_groups["looker_prod_redcataloguser"].id,
 okta_group.okta_assigned_groups["looker_prod_reddeveloper"].id,
 okta_group.okta_assigned_groups["looker_prod_reduser"].id,
 okta_group.okta_assigned_groups["looker_prod_user"].id,
 okta_group.okta_assigned_groups["looker_prod_viewer"].id,
 okta_group.okta_assigned_groups["looker_uat_admin"].id,
 okta_group.okta_assigned_groups["looker_uat_analyst"].id,
 okta_group.okta_assigned_groups["looker_uat_developer"].id,
 okta_group.okta_assigned_groups["looker_uat_financedeveloper"].id,
 okta_group.okta_assigned_groups["looker_uat_financeuser"].id,
 okta_group.okta_assigned_groups["looker_uat_redcatalogdeveloper"].id,
 okta_group.okta_assigned_groups["looker_uat_redcataloguser"].id,
 okta_group.okta_assigned_groups["looker_uat_reddeveloper"].id,
 okta_group.okta_assigned_groups["looker_uat_reduser"].id,
 okta_group.okta_assigned_groups["looker_uat_user"].id,
 okta_group.okta_assigned_groups["looker_uat_viewer"].id,
 okta_group.okta_assigned_groups["lucidchart_licensed"].id,
 okta_group.okta_assigned_groups["lucidchart_unlicensed"].id,
 okta_group.okta_assigned_groups["lucidscale_licensed"].id,
 okta_group.okta_assigned_groups["lucid_billingadmin"].id,
 okta_group.okta_assigned_groups["lucid_teamadmin"].id,
 okta_group.okta_assigned_groups["marketo"].id,
 okta_group.okta_assigned_groups["marketo_admin"].id,
 okta_group.okta_assigned_groups["marketo_analytics_user"].id,
 okta_group.okta_assigned_groups["marketo_ipad_remote_event_access"].id,
 okta_group.okta_assigned_groups["marketo_marketing_user"].id,
 okta_group.okta_assigned_groups["marketo_web_designer"].id,
 okta_group.okta_assigned_groups["mayo_clinic_carelink"].id,
 okta_group.okta_assigned_groups["microsoft_business_standard"].id,
 okta_group.okta_assigned_groups["microsoft_business_premium"].id,
 okta_group.okta_assigned_groups["microsoft_super_admin"].id,
 okta_group.okta_assigned_groups["microsoft_helpdesk_admin"].id,
 okta_group.okta_assigned_groups["microsoft_standard_user"].id,
 okta_group.okta_assigned_groups["microsoft_unlicensed"].id,
 okta_group.okta_assigned_groups["nas_admin"].id,
 okta_group.okta_assigned_groups["nas_pwm"].id,
 okta_group.okta_assigned_groups["nas_rno"].id,
 okta_group.okta_assigned_groups["new_relic"].id,
 okta_group.okta_assigned_groups["new_relic_admin"].id,
 okta_group.okta_assigned_groups["new_relic_owner"].id,
 okta_group.okta_assigned_groups["nice_cxo"].id,
 okta_group.okta_assigned_groups["nice_eem"].id,
 okta_group.okta_assigned_groups["nice_eem_admin"].id,
 okta_group.okta_assigned_groups["nice_qci"].id,
 okta_group.okta_assigned_groups["nice_qci_quality_admin"].id,
 okta_group.okta_assigned_groups["nice_qci_superuser"].id,
 okta_group.okta_assigned_groups["nice_qci_supervisor"].id,
 okta_group.okta_assigned_groups["nice_wfm"].id,
 okta_group.okta_assigned_groups["nice_wfm_admin"].id,
 okta_group.okta_assigned_groups["office365"].id,
 okta_group.okta_assigned_groups["officespace_software"].id,
 okta_group.okta_assigned_groups["officespace_software_booking_manager"].id,
 okta_group.okta_assigned_groups["officespace_software_facility_manager"].id,
 okta_group.okta_assigned_groups["officespace_software_move_manager"].id,
 okta_group.okta_assigned_groups["officespace_software_report_consumer"].id,
 okta_group.okta_assigned_groups["officespace_software_safeguard_guest"].id,
 okta_group.okta_assigned_groups["officespace_software_system_administrator"].id,
 okta_group.okta_assigned_groups["okta_device_trust_enforced"].id,
 okta_group.okta_assigned_groups["okta_jamf_yubikey_exception"].id,
 okta_group.okta_assigned_groups["oomnitza"].id,
 okta_group.okta_assigned_groups["oomnitza_accounting"].id,
 okta_group.okta_assigned_groups["oomnitza_admin"].id,
 okta_group.okta_assigned_groups["oomnitza_contract_owner"].id,
 okta_group.okta_assigned_groups["oomnitza_product_support"].id,
 okta_group.okta_assigned_groups["oomnitza_read_only_audit"].id,
 okta_group.okta_assigned_groups["opslevel"].id,
 okta_group.okta_assigned_groups["optinmonster_admin"].id,
 okta_group.okta_assigned_groups["optinmonster_author"].id,
 okta_group.okta_assigned_groups["optinmonster_manager"].id,
 okta_group.okta_assigned_groups["optinmonster_viewer"].id,
 okta_group.okta_assigned_groups["orca_alert_manager"].id,
 okta_group.okta_assigned_groups["orca_contributor"].id,
 okta_group.okta_assigned_groups["orca_editor"].id,
 okta_group.okta_assigned_groups["orca_viewer"].id,
 okta_group.okta_assigned_groups["oreilly_user"].id,
 okta_group.okta_assigned_groups["pagerduty_global_admin"].id,
 okta_group.okta_assigned_groups["pagerduty_manager"].id,
 okta_group.okta_assigned_groups["pagerduty_observer"].id,
 okta_group.okta_assigned_groups["pagerduty_responder"].id,
 okta_group.okta_assigned_groups["pagerduty_restricted_access"].id,
 okta_group.okta_assigned_groups["palo_alto_networks_panorama"].id,
 okta_group.okta_assigned_groups["palo_alto_networks_panorama_superuser"].id,
 okta_group.okta_assigned_groups["palo_alto_networks_panorama_superuser_read_only"].id,
 okta_group.okta_assigned_groups["patientping"].id,
 okta_group.okta_assigned_groups["prelude_user"].id,
 okta_group.okta_assigned_groups["prism"].id,
 okta_group.okta_assigned_groups["prisma_access_gateways"].id,
 okta_group.okta_assigned_groups["prisma_access_portal"].id,
 okta_group.okta_assigned_groups["production_ftp"].id,
 okta_group.okta_assigned_groups["pusher"].id,
 okta_group.okta_assigned_groups["qualtrics_owner"].id,
 okta_group.okta_assigned_groups["qualtrics_brand_ambassador"].id,
 okta_group.okta_assigned_groups["qualtrics_standard_qualtrics"].id,
 okta_group.okta_assigned_groups["qualys_contact"].id,
 okta_group.okta_assigned_groups["qualys_manager"].id,
 okta_group.okta_assigned_groups["qualys_reader"].id,
 okta_group.okta_assigned_groups["qualys_remediation_user"].id,
 okta_group.okta_assigned_groups["qualys_scanner"].id,
 okta_group.okta_assigned_groups["qualys_unit_manager"].id,
 okta_group.okta_assigned_groups["redox_phi"].id,
 okta_group.okta_assigned_groups["redox_user"].id,
 okta_group.okta_assigned_groups["rfpio_team_member"].id,
 okta_group.okta_assigned_groups["rfpio_admin_company"].id,
 okta_group.okta_assigned_groups["rfpio_admin_content_company_project"].id,
 okta_group.okta_assigned_groups["rfpio_admin_with_all_permissions"].id,
 okta_group.okta_assigned_groups["rfpio_manager"].id,
 okta_group.okta_assigned_groups["rfpio_project_requester"].id,
 okta_group.okta_assigned_groups["ringcentral_billing_admin"].id,
 okta_group.okta_assigned_groups["ringcentral_manager"].id,
 okta_group.okta_assigned_groups["ringcentral_phone_system_admin"].id,
 okta_group.okta_assigned_groups["ringcentral_standard"].id,
 okta_group.okta_assigned_groups["ringcentral_standard_int"].id,
 okta_group.okta_assigned_groups["ringcentral_standard_int_wo_prem"].id,
 okta_group.okta_assigned_groups["ringcentral_standard_no_prem"].id,
 okta_group.okta_assigned_groups["ringcentral_user_admin"].id,
 okta_group.okta_assigned_groups["rollbar"].id,
 okta_group.okta_assigned_groups["rubiconmd"].id,
 okta_group.okta_assigned_groups["rxadvance"].id,
 okta_group.okta_assigned_groups["salesforce_marketing_cloud"].id,
 okta_group.okta_assigned_groups["salesforce_marketing_cloud_administrator"].id,
 okta_group.okta_assigned_groups["salesforce_marketing_cloud_analyst"].id,
 okta_group.okta_assigned_groups["salesforce_marketing_cloud_content_creator"].id,
 okta_group.okta_assigned_groups["salesforce_marketing_cloud_data_manager"].id,
 okta_group.okta_assigned_groups["salesforce_marketing_cloud_distributed_sending_user"].id,
 okta_group.okta_assigned_groups["salesforce_marketing_cloud_marketing_cloud_administrator"].id,
 okta_group.okta_assigned_groups["salesforce_marketing_cloud_marketing_cloud_content_editor_publisher"].id,
 okta_group.okta_assigned_groups["salesforce_marketing_cloud_marketing_cloud_marketing_cloud_channel_manager"].id,
 okta_group.okta_assigned_groups["salesforce_marketing_cloud_marketing_cloud_security_administrator"].id,
 okta_group.okta_assigned_groups["salesforce_marketing_cloud_marketing_cloud_viewer"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_gr_accounting_user"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_gr_bdr_user"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_gr_case_management_user"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_gr_customer_solutions_user"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_gr_customer_success_user"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_gr_demand_generation_user"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_gr_finance_user"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_gr_gtm_ops_user"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_gr_implementations_user"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_gr_included_health"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_standard_user"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_gr_read_only_user"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_gr_sales_user"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_gr_solutions_engineering_user"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud_system_administrator"].id,
 okta_group.okta_assigned_groups["salesforce_sales_cloud"].id,
 okta_group.okta_assigned_groups["sandbox_five9_uat_salesforce_uat"].id,
 okta_group.okta_assigned_groups["sendbird_admin"].id,
 okta_group.okta_assigned_groups["sendbird_billing"].id,
 okta_group.okta_assigned_groups["sendbird_dev_and_test_engineer"].id,
 okta_group.okta_assigned_groups["sendbird_owner"].id,
 okta_group.okta_assigned_groups["sendbird_pilot_agent"].id,
 okta_group.okta_assigned_groups["sendbird_production_viewer"].id,
 okta_group.okta_assigned_groups["sendgrid_admin"].id,
 okta_group.okta_assigned_groups["sendgrid_ldod_admin"].id,
 okta_group.okta_assigned_groups["sendgrid_ldod_read_only_access"].id,
 okta_group.okta_assigned_groups["sendgrid_ldod_restricted_access_custom"].id,
 okta_group.okta_assigned_groups["sendgrid_read_only_access"].id,
 okta_group.okta_assigned_groups["sendgrid_restricted_access_custom"].id,
 okta_group.okta_assigned_groups["sendoso_admin"].id,
 okta_group.okta_assigned_groups["sendoso_department_admin"].id,
 okta_group.okta_assigned_groups["sendoso_manager"].id,
 okta_group.okta_assigned_groups["sendoso_sender"].id,
 okta_group.okta_assigned_groups["sendwithus_admin"].id,
 okta_group.okta_assigned_groups["sendwithus_editor"].id,
 okta_group.okta_assigned_groups["sendwithus_publisher"].id,
 okta_group.okta_assigned_groups["sendwithus_reader"].id,
 okta_group.okta_assigned_groups["sentry_admin_nonprod"].id,
 okta_group.okta_assigned_groups["sentry_nonprod"].id,
 okta_group.okta_assigned_groups["sentry_prod"].id,
 okta_group.okta_assigned_groups["sentry_prod_admin"].id,
 okta_group.okta_assigned_groups["sg_admin_leave"].id,
 okta_group.okta_assigned_groups["sg_int_access_all_restrictions"].id,
 okta_group.okta_assigned_groups["sg_int_access_restrictions_mail"].id,
 okta_group.okta_assigned_groups["sg_int_access_restrictions_mail_drive"].id,
 okta_group.okta_assigned_groups["sg_limited_access_term"].id,
 okta_group.okta_assigned_groups["shareworks"].id,
 okta_group.okta_assigned_groups["shareworks_admin"].id,
 okta_group.okta_assigned_groups["signalfx_admin"].id,
 okta_group.okta_assigned_groups["signalfx_member"].id,
 okta_group.okta_assigned_groups["signal_sciences"].id,
 okta_group.okta_assigned_groups["signal_sciences_admin"].id,
 okta_group.okta_assigned_groups["signal_sciences_observer"].id,
 okta_group.okta_assigned_groups["signal_sciences_owner"].id,
 okta_group.okta_assigned_groups["sketch"].id,
 okta_group.okta_assigned_groups["slack_connect_channels_admin"].id,
 okta_group.okta_assigned_groups["slack_connect_compliance_admin"].id,
 okta_group.okta_assigned_groups["slack_connect_member"].id,
 okta_group.okta_assigned_groups["slack_dev_eng_channels_admin"].id,
 okta_group.okta_assigned_groups["slack_dev_eng_compliance_admin"].id,
 okta_group.okta_assigned_groups["slack_dev_eng_member"].id,
 okta_group.okta_assigned_groups["slack_epdd_channels_admin"].id,
 okta_group.okta_assigned_groups["slack_epdd_compliance_admin"].id,
 okta_group.okta_assigned_groups["slack_epdd_member"].id,
 okta_group.okta_assigned_groups["slack_ih_channels_admin"].id,
 okta_group.okta_assigned_groups["slack_ih_compliance_admin"].id,
 okta_group.okta_assigned_groups["slack_ih_member"].id,
 okta_group.okta_assigned_groups["slack_ih_multi_channel_guest"].id,
 okta_group.okta_assigned_groups["slack_ih_single_channel_guest"].id,
 okta_group.okta_assigned_groups["smartling_account_owner"].id,
 okta_group.okta_assigned_groups["smartling_project_manager"].id,
 okta_group.okta_assigned_groups["stripe_administrator"].id,
 okta_group.okta_assigned_groups["stripe_analyst"].id,
 okta_group.okta_assigned_groups["stripe_dispute-analyst"].id,
 okta_group.okta_assigned_groups["stripe_iam-admin"].id,
 okta_group.okta_assigned_groups["stripe_view-only"].id,
 okta_group.okta_assigned_groups["surveymonkey"].id,
 okta_group.okta_assigned_groups["surveymonkey_admin"].id,
 okta_group.okta_assigned_groups["tableau_creator"].id,
 okta_group.okta_assigned_groups["tableau_explorer"].id,
 okta_group.okta_assigned_groups["tableau_explorer_can_publish"].id,
 okta_group.okta_assigned_groups["tableau_site_administrator_creator"].id,
 okta_group.okta_assigned_groups["tableau_site_administrator_explorer"].id,
 okta_group.okta_assigned_groups["tableau_viewer"].id,
 okta_group.okta_assigned_groups["talentlms_admin"].id,
 okta_group.okta_assigned_groups["talentlms_instructor"].id,
 okta_group.okta_assigned_groups["talentlms_learner"].id,
 okta_group.okta_assigned_groups["talentlms_super_admin"].id,
 okta_group.okta_assigned_groups["tasktop_auth"].id,
 okta_group.okta_assigned_groups["tasktop_user"].id,
 okta_group.okta_assigned_groups["textexpander"].id,
 okta_group.okta_assigned_groups["textexpander_careteam_leadership"].id,
 okta_group.okta_assigned_groups["textexpander_care_team"].id,
 okta_group.okta_assigned_groups["textexpander_claims_team"].id,
 okta_group.okta_assigned_groups["textexpander_claims_team_google"].id,
 okta_group.okta_assigned_groups["textexpander_claims_team_leadership"].id,
 okta_group.okta_assigned_groups["textexpander_clinical_vcs"].id,
 okta_group.okta_assigned_groups["textexpander_communities"].id,
 okta_group.okta_assigned_groups["textexpander_record_specialists"].id,
 okta_group.okta_assigned_groups["textexpander_record_spec_leadership"].id,
 okta_group.okta_assigned_groups["textexpander_recruiting"].id,
 okta_group.okta_assigned_groups["textexpander_technology"].id,
 okta_group.okta_assigned_groups["textexpander_the_clinic"].id,
 okta_group.okta_assigned_groups["textexpander_the_clinic_leadership"].id,
 okta_group.okta_assigned_groups["textexpander_urgent_care"].id,
 okta_group.okta_assigned_groups["trello"].id,
 okta_group.okta_assigned_groups["twilio_administrator"].id,
 okta_group.okta_assigned_groups["twilio_billing_manager"].id,
 okta_group.okta_assigned_groups["twilio_developer"].id,
 okta_group.okta_assigned_groups["twilio_owner"].id,
 okta_group.okta_assigned_groups["uberflip_account_admins"].id,
 okta_group.okta_assigned_groups["uberflip_analysts"].id,
 okta_group.okta_assigned_groups["uberflip_authors"].id,
 okta_group.okta_assigned_groups["uberflip_content_managers"].id,
 okta_group.okta_assigned_groups["uberflip_demand_generation"].id,
 okta_group.okta_assigned_groups["uberflip_developers___designers"].id,
 okta_group.okta_assigned_groups["uberflip_sales_reps"].id,
 okta_group.okta_assigned_groups["uber_health"].id,
 okta_group.okta_assigned_groups["udemy_for_business"].id,
 okta_group.okta_assigned_groups["umr_business_portal"].id,
 okta_group.okta_assigned_groups["verizon_wireless"].id,
 okta_group.okta_assigned_groups["webex_webex_meetings_suite"].id,
 okta_group.okta_assigned_groups["workday_sandbox"].id,
 okta_group.okta_assigned_groups["workday_sandbox_preview"].id,
 okta_group.okta_assigned_groups["zendesk"].id,
 okta_group.okta_assigned_groups["zero_touch"].id,
 okta_group.okta_assigned_groups["zoom_admin_basic"].id,
 okta_group.okta_assigned_groups["zoom_admin_concurrent"].id,
 okta_group.okta_assigned_groups["zoom_admin_concurrent_webinar"].id,
 okta_group.okta_assigned_groups["zoom_admin_pro"].id,
 okta_group.okta_assigned_groups["zoom_admin_webinar"].id,
 okta_group.okta_assigned_groups["zoom_member_concurrent"].id,
 okta_group.okta_assigned_groups["zoom_member_concurrent_webinar"].id,
 okta_group.okta_assigned_groups["zoom_member_pro"].id,
 okta_group.okta_assigned_groups["zoom_member_webinar"].id,
 okta_group.okta_assigned_groups["zoom_telemedicine_admin_basic"].id,
 okta_group.okta_assigned_groups["zoom_telemedicine_admin_pro"].id,
 okta_group.okta_assigned_groups["zoom_telemedicine_member_basic"].id,
 okta_group.okta_assigned_groups["zoom_telemedicine_member_pro"].id,
 okta_group.okta_assigned_groups["sg_google_auth_exception"].id,
 okta_group.okta_assigned_groups["sg_restrict_meet_recording"].id,
 ]
}
resource "okta_group_role" "okta_admin_it_help_desk" {
 group_id = okta_group.terraform_assigned_groups["okta_admin_it"].id
 role_type = "HELP_DESK_ADMIN"
 target_group_list = [
 okta_group.okta_inherited_groups["all_non_admins"].id,
 okta_group.terraform_assigned_groups["okta_admin_it"].id,
 okta_group.terraform_assigned_groups["okta_admin_it_msp"].id,
 okta_group.terraform_assigned_groups["okta_admin_prod_support"].id,
 okta_group.terraform_assigned_groups["okta_admin_read_only"].id,
 ]
}
resource "okta_group_role" "okta_admin_it_read_only" {
 group_id = okta_group.terraform_assigned_groups["okta_admin_it"].id
 role_type = "READ_ONLY_ADMIN"
}

# ------------------------------------------------------------------------------------------# ------------------------------------------------------------------------------------------
# Okta Super Admins

locals {
 human_okta_read_only_admin_users = toset([

 local.okta_users["joe.willis,goesef@gmail.com"].id,

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
 group_id = okta_group.terraform_assigned_groups["okta_admin_super_admin"].id
 role_type = "SUPER_ADMIN"
}

# ------------------------------------------------------------------------------------------# ------------------------------------------------------------------------------------------
# Service accounts with Read-Only Okta admin privileges

resource "okta_group_role" "okta_admin_read_only_service_accounts_read_only" {
 group_id = okta_group.terraform_assigned_groups["okta_admin_read_only_service_accounts"].id
 role_type = "READ_ONLY_ADMIN"
}

# ------------------------------------------------------------------------------------------# ------------------------------------------------------------------------------------------
# Service accounts with Okta Super Admin privileges

resource "okta_group_role" "okta_admin_super_admin_service_accounts_super_admin" {
 group_id = okta_group.terraform_assigned_groups["okta_admin_super_admin_service_accounts"].id
 role_type = "SUPER_ADMIN"
}

# ------------------------------------------------------------------------------------------# ------------------------------------------------------------------------------------------
# Okta custom admin role declarations. Add your new custom admin role information below. Don't change existing ones

locals {
 custom_admins = [
 {
 id = "app_reader",
 name = "App Reader",
 description = "This role grants app read permissions for the assigned resource set",
 permissions = [
 "okta.apps.read"
 ]
 },
 {
 id = "it_custom_administrators_group_management",
 name = "IT Custom Administrators - Group Management",
 description = "This role gives permissions to manage certain group memberships defined in the Resource Set",
 permissions = [
 "okta.groups.read",
 "okta.groups.members.manage",
 "okta.users.groupMembership.manage"
 ]
 }
 ]
}
# This creates those custom admin roles from above local variable declarations.
resource "okta_admin_role_custom" "ih_custom_admin_roles" {
 for_each = { for custom_admin in local.custom_admins : custom_admin.id => custom_admin }
 label = each.value.name
 description = each.value.description
 permissions = each.value.permissions
}
locals {
 custom_roles_template = { for mapping in local.custom_admin_mappings_csv : format("%s<=>%s", mapping.custom_role, mapping.resource_set) => mapping.id... }
}
resource "okta_admin_role_custom_assignments" "custom_role_assignment_bindings" {
 for_each = local.custom_roles_template
 resource_set_id = local.resources[split("<=>", each.key)[1]].id
 custom_role_id = local.custom_admin_roles[split("<=>", each.key)[0]].id
 members = [
 for id in each.value : contains(local.service_account_list, id) ? local.service_accounts[id].url : local.groups[id].url
 ]
}
# #This binding/assignment maps those custom admin roles, resource sets and users/groups with those custom admin permissionss
# resource "okta_admin_role_custom_assignments" "custom_role_assignment_bindings" {
# for_each = { for custom_admin_mapping in local.custom_admin_mappings_csv : format("%s+%s+%s", custom_admin_mapping.id, custom_admin_mapping.resource_set, custom_admin_mapping.custom_role) => custom_admin_mapping }
# resource_set_id = local.resources[each.value.resource_set].id
# custom_role_id = local.custom_admin_roles[each.value.custom_role].id
# members = [
# contains(local.service_account_list, each.value.id) ? local.service_accounts[each.value.id].url : local.groups[each.value.id].url
# ]
# }
