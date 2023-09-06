#
# Definition of applications that use IH SSO.
#
# Full details for these applications can be found at:
# https://includedhealth.atlassian.net/wiki/spaces/ENG/pages/3687547029/IAM+Internal+App+SSO+Paved+Road
#
# Applications are defined by an entry on the list defined below in the `ih_sso_applications` local
# variable. Check the documentation attached to the variable for details.
#
# The role should be defined in the `ih_sso_roles` list, mapping the role name to a "friendly"
# string that should be shown in the Okta console. The friendly string is never exposed to
# services.
#
# Roles are implemented as Okta Groups; adding a user to the group means it will be able to log
# in to the application, and the corrsponding role(s) will be listed in the generated access token.
#
# Documentation for this feature can be found at:
# https://includedhealth.atlassian.net/wiki/spaces/ENG/pages/3800433030/SSO+For+Internal+Services
#
# Some of the resources created here follow a contract with other code that performs user
# authentication; the spec can be seen at the following URL:
# https://github.com/ConsultingMD/ih-auth0/blob/main/docs/how-to/internal-sso-auth.md
#

locals {
  #
  # Maps the role names used by services to the friendly UI name for the group.
  #
  ih_sso_roles = {
    "admin" : "Administrator"
    "campaign_manager_reader" : "Campaign Manager Reader"
    "campaign_manager_writer" : "Campaign Manager Writer"
    "campaign_manager_admin" : "Campaign Manager Admin"
    "coordinator" : "Care Coordinator"
    "engineer" : "Engineer"
    "member_insights_plugin_pilot" : "Member Insights Plugin Pilot User"
    "consumer_marketing_team" : "Consumer Marketing Team"
    "customer_success_manager" : "Customer Success Manager"
    "sensitive_report_recipient" : "Sensitive Report Recipient"

    #### Data platform roles ####
    # Data Platform Catalog Access
    "catalog_red_user" : "Lasik Catalog Access (Red)"
    "catalog_yellow_user" : "Lasik Catalog Access (Yellow)"
    # Data Platform Dataset Access
    "datahub_yellow_user" : "Legacy Lasik Access (Yellow)"
    "dataset_finance_user" : "Lasik Data Access (Finance)"
    "dataset_green_user" : "Lasik Data Access (Green)"
    "dataset_red_user" : "Lasik Data Access (Red)"
    # Data Platform service admins
    "catalog_airflow_admin" : "Catalog Airflow Admin"
    "jupyter_admin" : "Jupyterhub Admin"
    "querybook_admin" : "Querybook Admin Access"
  }

  #
  # Maps an application name (which should match an internal service, or individual app within
  # a service, configured for SSO) to a configuration that should follow the following schema:
  #
  # {
  #   DisplayName: string - Name to display in the Okta UI. Also used in service configuration
  #                         to link the Okta application with Auth0.
  #   Roles: list(string) - List of role (= group) names that give access to the service. Entries
  #                         should match keys in the `ih_sso_roles` map above.
  # }
  #
  # At least one role is required, or there will be no way to grant access to the service. If the
  # service doesn't specifically check for any roles, either create a role with the same name as the
  # service, or pick an existing one that maps to the desired target group of users.
  #
  ih_sso_applications = {
    "campaign-manager" : {
      DisplayName : "Campaign Manager"
      Roles : [
        "campaign_manager_reader",
        "campaign_manager_writer",
        "campaign_manager_admin",
      ]
    }

    "chat" : {
      DisplayName : "Chat Service"
      Roles : [
        "admin",
        "engineer",
      ]
    }

    "querybook" : {
      DisplayName : "Querybook",
      Roles : [
        "catalog_red_user",
        "catalog_yellow_user",
        "datahub_yellow_user",
        "dataset_finance_user",
        "dataset_green_user",
        "dataset_red_user",
        "querybook_admin",
      ]
    }

    "jupyter" : {
      DisplayName : "Jupyterhub",
      Roles : [
        "datahub_yellow_user",
        "jupyter_admin",
      ],
    }

    "catalog_airflow" : {
      DisplayName : "Catalog Airflow",
      Roles : [
        "catalog_airflow_admin",
      ]
    }

    "member-insights-plugin" : {
      DisplayName : "Member Insights Plugin",
      Roles : [
        "member_insights_plugin_pilot",
        "coordinator",
      ]
    }

    "hermes" : {
      DisplayName : "Hermes",
      Roles : [
        "admin",
        "consumer_marketing_team",
        "customer_success_manager",
        "sensitive_report_recipient",
      ]
    }
  }

  ih_sso_display_name_prefix = "IH - "
  ih_sso_auth0_name_prefix   = "ih-sso-"
  ih_sso_group_name_prefix   = "IAM - IH SSO - "

  # The following values vary by environment and should match the target Auth0 tenant.
  #
  # ih-epdd:    includedhealth-sandbox
  # ih-uat:     includedhealth-uat
  # production: includedhealth-prod
  #
  # For UAT and production, we should use the includedhealth.com addresses; the sandbox environment
  # does not have one and should use the auth0.com address.
  ih_sso_tenant                = "includedhealth-production"
  ih_sso_auth0_callback_prefix = "https://auth.includedhealth.com/login/callback?connection=${local.ih_sso_auth0_name_prefix}"
}

resource "okta_app_saml" "ih_sso_app" {
  for_each = local.ih_sso_applications

  label       = "${local.ih_sso_display_name_prefix}${each.value.DisplayName}"
  sso_url     = "${local.ih_sso_auth0_callback_prefix}${each.key}"
  recipient   = "${local.ih_sso_auth0_callback_prefix}${each.key}"
  destination = "${local.ih_sso_auth0_callback_prefix}${each.key}"
  audience    = "urn:auth0:${local.ih_sso_tenant}:${local.ih_sso_auth0_name_prefix}${each.key}"

  subject_name_id_format   = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  subject_name_id_template = "$${user.userName}"
  user_name_template       = "$${source.email}"

  # The following are default values filled out by the Okta console when you create the app manually.
  assertion_signed        = true
  authn_context_class_ref = "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport"
  digest_algorithm        = "SHA256"
  honor_force_authn       = true
  response_signed         = true
  signature_algorithm     = "RSA_SHA256"

  attribute_statements {
    type      = "EXPRESSION"
    name      = "email"
    namespace = "urn:oasis:names:tc:SAML:2.0:attrname-format:basic"
    values    = ["user.email"]
  }

  attribute_statements {
    type      = "EXPRESSION"
    name      = "roles"
    namespace = "urn:oasis:names:tc:SAML:2.0:attrname-format:basic"
    values    = ["appuser.roles"]
  }

  # The old Okta provider we're using seems to think that groups added via
  # okta_app_group_assignments need to be removed since they're not declared
  # in this resource. This tells terraform to ignore the groups property and
  # (hopefully) we won't have groups unassigned from apps mysteriously.
  lifecycle {
    ignore_changes = [
      groups,
      logo_url,
    ]
  }
}

resource "okta_app_group_assignments" "ih_sso_app_group" {
  for_each = local.ih_sso_applications

  app_id = okta_app_saml.ih_sso_app[each.key].id

  dynamic "group" {
    for_each = each.value.Roles
    content {
      id = okta_group.ih_sso_group[group.value].id
      profile = jsonencode({
        "roles" : [group.value]
      })
    }
  }


  depends_on = [
    okta_app_user_schema_property.ih_sso_role_property,
  ]
}

#
# User schema property that encodes group membership information into the user profile.
# This is referenced in the attribute statements of the corresponding application, so
# that the role list is exposed to the backend service.
#
# The property configuration collects the role names from all the groups assigned to the
# user that give access to the corresponding application.
#
resource "okta_app_user_schema_property" "ih_sso_role_property" {
  for_each = local.ih_sso_applications

  app_id      = resource.okta_app_saml.ih_sso_app[each.key].id
  type        = "array"
  array_type  = "string"
  index       = "roles"
  title       = "Roles"
  description = "Roles assigned to user via group membership."
  required    = false
  union       = true
  permissions = "READ_ONLY"
  scope       = "NONE"

  array_enum = each.value.Roles

  dynamic "array_one_of" {
    for_each = each.value.Roles
    iterator = role

    content {
      const = role.value
      title = local.ih_sso_roles[role.value]
    }
  }
}

# resource "okta_resource_set" "ih_sso_app_set" {
#   label       = "IH SSO Applications"
#   description = "All the applications configuring SSO for internal IH services."

#   resources = [
#     for app in okta_app_saml.ih_sso_app : format("%s/api/v1/apps/%s", local.org_url, app.id)
#   ]
# }
