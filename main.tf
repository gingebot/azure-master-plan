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
  name     = "gingebotics-${vars.env}"
  location = "UK South"
}
