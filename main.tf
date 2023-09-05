terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      version = "~> 4.3.0"
    }
  }
}
    workspaces {
      name = "IncludedDevOkta"
    }
  }

provider "tfe" {
  token = var.api_token
  }
