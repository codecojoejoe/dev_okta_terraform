terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      version = "~> 4.3.0"
    }
  }
}

provider "tfe" {
  token = var.api_token
  }
