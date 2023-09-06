# ------------------------------------------------------------------------------------------
# Custom Okta user profile attributes

resource "okta_user_schema_property" "workday_universal_id" {
  index       = "workdayUniversalID"
  title       = "Workday Universal ID"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "workday_active_status" {
  index       = "workdayActiveStatus"
  title       = "Workday Active Status"
  description = "Workday user work authorization data"
  type        = "boolean"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "training_compliance_status" {
  index       = "trainingComplianceStatus"
  title       = "Training Compliance Status"
  description = "Workday user work authorization data"
  type        = "boolean"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "gr_leader" {
  index       = "grLeader"
  title       = "GR Leader"
  description = "Workday user org-chart data"
  type        = "boolean"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "on_leave_flag" {
  index       = "onLeaveFlag"
  title       = "On Leave Flag"
  description = "Workday user org-chart data"
  type        = "boolean"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "preferred_first_name" {
  index       = "preferredFirstName"
  title       = "Preferred First Name"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "preferred_last_name" {
  index       = "preferredLastName"
  title       = "Preferred Last Name"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "preferred_middle_name" {
  index       = "preferredMiddleName"
  title       = "Preferred Middle Name"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "office_location" {
  index       = "officeLocation"
  title       = "Office Location"
  description = "Workday user office location"
  type        = "string"
  permissions = "READ_ONLY"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "physical_location" {
  index       = "physicalLocation"
  title       = "Physical Location"
  description = "Workday user geographical region"
  type        = "string"
  permissions = "READ_ONLY"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "worker_type" {
  index       = "workerType"
  title       = "Worker Type"
  description = "Workday user type"
  type        = "string"
  permissions = "READ_ONLY"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "time_type" {
  index       = "timeType"
  title       = "Time Type"
  description = "Workday user type"
  type        = "string"
  permissions = "READ_ONLY"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "worker_subtype" {
  index       = "workerSubtype"
  title       = "Worker Subtype"
  description = "Workday user type"
  type        = "string"
  permissions = "READ_ONLY"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "business_title" {
  index       = "businessTitle"
  title       = "Business Title"
  description = "Workday user profile data"
  type        = "string"
  permissions = "READ_ONLY"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "job_profile" {
  index       = "jobProfile"
  title       = "Job Profile"
  description = "Workday user org-chart data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "job_code" {
  index       = "jobCode"
  title       = "Job Code"
  description = "Workday user org-chart data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "job_family_group" {
  index       = "jobFamilyGroup"
  title       = "Job Family Group"
  description = "Workday user org-chart data"
  type        = "string"
  permissions = "READ_ONLY"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "job_family_group_id" {
  index       = "jobFamilyGroupID"
  title       = "Job Family Group ID"
  description = "Workday user org-chart data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "job_family" {
  index       = "jobFamily"
  title       = "Job Family"
  description = "Workday user org-chart data"
  type        = "string"
  permissions = "READ_ONLY"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "job_family_id" {
  index       = "jobFamilyID"
  title       = "Job Family ID"
  description = "Workday user org-chart data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "company" {
  index       = "company"
  title       = "Company"
  description = "Workday user org-chart data"
  type        = "string"
  permissions = "READ_ONLY"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "hire_date" {
  index       = "hireDate"
  title       = "Hire Date"
  description = "Workday user work authorization data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "original_hire_date" {
  index       = "originalHireDate"
  title       = "Original Hire Date"
  description = "Workday user work authorization data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "end_date" {
  index       = "endDate"
  title       = "End Date"
  description = "Workday user work authorization data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "last_day_worked" {
  index       = "lastDayWorked"
  title       = "Last Day Worked"
  description = "Workday user work authorization data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "legacy_username" {
  index       = "legacyUsername"
  title       = "Legacy Username"
  description = "Workday user pre-merger profile data"
  type        = "string"
  permissions = "READ_ONLY"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "line_of_business" {
  index       = "lineOfBusiness"
  title       = "Line of Business"
  description = "Workday user org-chart data"
  type        = "string"
  permissions = "READ_ONLY"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "pronouns" {
  index       = "pronouns"
  title       = "Pronouns"
  description = "Workday user profile data"
  type        = "string"
  permissions = "READ_ONLY"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "manager_email" {
  index       = "managerEmail"
  title       = "Manager Email"
  description = "Workday user profile data"
  type        = "string"
  permissions = "READ_ONLY"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "bolt_leader" {
  index       = "boltLeader"
  title       = "Bolt Leader"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "people_manager_string" {
  index       = "peopleManagerString"
  title       = "People Manager (String Value)"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "content_worker_supplier" {
  index       = "contingentWorkerSupplier"
  title       = "Content Worker Supplier"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "engineering_team" {
  index       = "engineeringTeam"
  title       = "Engineering Team"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "management_group" {
  index       = "managementGroup"
  title       = "Management Group"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "management_level" {
  index       = "managementLevel"
  title       = "Management Level"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "l3_leader" {
  index       = "l3Leader"
  title       = "L3 Leader"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "location" {
  index       = "location"
  title       = "Location"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "loa_start_date" {
  index       = "loaStartDate"
  title       = "LOA Start Date"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "loa_end_date" {
  index       = "loaEndDate"
  title       = "LOA End Date"
  description = "Workday user profile data"
  type        = "string"
  permissions = "HIDE"
  master      = "PROFILE_MASTER"
}

resource "okta_user_schema_property" "talentlms_username" {
  index       = "talentlmsUsername"
  title       = "TalentLMS Username"
  description = "Temporary attribute for TalentLMS migration"
  type        = "string"
  permissions = "HIDE"
  master      = "OKTA"
}
