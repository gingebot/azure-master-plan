terraform {
  cloud {
    organization = "gingebotics"
    workspaces {
      tags = ["app:azure-master-plan"]
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "main" {
  name     = "gingebotics-${var.env}"
  location = "UK South"
}
