# ------------------------------------------------------------------------------------------
# Variables defined in Terraform Cloud

variable "api_token" {}
variable "base_url" {}
variable "org_name" {}
variable "domain" {}
variable "brand_name" {}
variable "human_okta_admin_users" {
  type = map(string)
}
variable "applications" {
  type = map(string)
}
