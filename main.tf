terraform {
  required_providers {
    tfe = {
      version = "4.3.0"
    }
  }
  backend "remote" {
    organization = "included-dev"

    workspaces {
      name = "IncludedDevOkta"
    }
  }
}
provider "tfe" {
  token = var.api_token
}

resource "okta_group" "example_group" {
  name = "Example Group"
  }
