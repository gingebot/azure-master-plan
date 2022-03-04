terraform {
  cloud {
    organization = "gingebotics"
    workspaces {
      name = "azure-master-plan-DEV"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "gingebotics-${var.env}"
  location = "UK South"
}
