terraform {
  cloud {
    organization = "gingebotics"

    workspaces {
      name = "azure-master-plan-DEV"
    }
  }
}