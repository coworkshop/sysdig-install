terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    sysdig = {
      source = "sysdiglabs/sysdig"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
provider "sysdig" {
  sysdig_secure_url       = "https://eu1.app.sysdig.com"
  sysdig_secure_api_token = var.sysdig_secure_api_token
}


provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
  module "secure_for_cloud_example_single_subscription" {
    source = "sysdiglabs/secure-for-cloud/azurerm//examples/single-subscription"
  }
}
