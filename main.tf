terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      version = "~> 4.3.0"
    }
  }
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
