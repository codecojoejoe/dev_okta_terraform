terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      version = "4.3.0"
    }
  }
}

provider "okta" {
  org_name    = "https://included-dev"
  base_url    = "oktapreview.com"
  client_id   = "0oa9uf3rpuVVGrtBc1d7"
  scopes      = ["okta.groups.manage"]
  private_key = "/Users/joe.willis/DevOktaTerraform/okta-tf-ihdev-privatekey"
}

resource "okta_group" "example_group" {
  name = "Example Group"
}
