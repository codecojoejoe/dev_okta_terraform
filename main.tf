﻿terraform {
 required_providers {
 okta = {
 source = "okta/okta"
 version = "4.10.0"
 }
 }
 backend "remote" {
 organization = "included-dev"
 workspaces {
 name = "dev-terraform"
 }
 }
}
provider "okta" {
 org_name = var.org_name
 base_url = var.base_url
 api_token = var.api_token
}