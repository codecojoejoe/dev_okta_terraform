locals {
  resource_sets = [
    {
      id          = "ih_sso_applications",
      name        = "IH SSO - Applications",
      description = "All the applications configuring SSO for internal IH services.",
      resources = [
        for app in okta_app_saml.ih_sso_app : format("%s/api/v1/apps/%s", local.org_url, app.id)
      ]
    },
    {
      id          = "it_administered_groups",
      name        = "IT Managed Groups",
      description = "All the groups managed by IT",
      resources = [
        for group in local.it_managed_groups : local.groups[group].url
      ]
    }
  ]
}



#resource sets creation

resource "okta_resource_set" "ih_resource_sets" {
  for_each    = { for resource in local.resource_sets : resource.id => resource }
  label       = each.value.name
  description = each.value.description
  resources   = each.value.resources
}



locals {
  resources = {
    for resource in local.resource_sets : resource.id => okta_resource_set.ih_resource_sets[resource.id]
  }
  custom_admin_roles = {
    for custom_admin in local.custom_admins : custom_admin.id => okta_admin_role_custom.ih_custom_admin_roles[custom_admin.id]
  }
}

