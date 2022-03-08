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
}

resource "azurerm_resource_group" "main" {
  name     = "gingebotics-${var.env}"
  location = "UK South"
}
