# ------------------------------------------------------------------------------------------
# Okta Workflows

resource "okta_app_group_assignments" "okta_workflows" {
  app_id = var.applications["okta_workflows"]
  group {
    id       = okta_group.terraform_assigned_groups["okta_admin_super_admin"].id
    priority = 1
  }
  group {
    id       = okta_group.terraform_assigned_groups["okta_admin_super_admin_service_accounts"].id
    priority = 2
  }
}

# ------------------------------------------------------------------------------------------
# Okta Workflows OAuth

resource "okta_app_group_assignments" "okta_workflows_oauth" {
  app_id = var.applications["okta_workflows_oauth"]
  group {
    id       = okta_group.terraform_assigned_groups["okta_admin_super_admin"].id
    priority = 1
  }
  group {
    id       = okta_group.terraform_assigned_groups["okta_admin_super_admin_service_accounts"].id
    priority = 2
  }
}

# ------------------------------------------------------------------------------------------
# Workday Sandbox

resource "okta_app_group_assignments" "workday_sandbox" {
  app_id = var.applications["workday_sandbox"]
  group {
    id       = okta_group.okta_assigned_groups["workday_sandbox"].id
    priority = 1
  }
}

# ------------------------------------------------------------------------------------------
# Workday Sandbox Preview

resource "okta_app_group_assignments" "workday_sandbox_preview" {
  app_id = var.applications["workday_sandbox_preview"]
  group {
    id       = okta_group.okta_assigned_groups["workday_sandbox_preview"].id
    priority = 1
  }
}

# ------------------------------------------------------------------------------------------
# Terraform Cloud

resource "okta_app_group_assignments" "terraform_cloud" {
  app_id = var.applications["terraform_cloud"]
  group {
    id       = okta_group.okta_assigned_groups["terraform_cloud_owner"].id
    priority = 1
  }
  group {
    id       = okta_group.okta_assigned_groups["terraform_cloud"].id
    priority = 2
  }
}

# ------------------------------------------------------------------------------------------
# GitHub - IT Infra

resource "okta_app_group_assignments" "github_it_infra" {
  app_id = var.applications["github_it_infra"]
  group {
    id       = okta_group.okta_assigned_groups["github_it_infra_owner"].id
    priority = 1
  }
  group {
    id       = okta_group.okta_assigned_groups["github_it_infra_member"].id
    priority = 2
  }
}
