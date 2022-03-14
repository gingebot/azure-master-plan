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


module "vnet" {
  source = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.1.0.0/16"]
  subnet_prefixes     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  depends_on = [    azurerm_resource_group.main  ]
}
