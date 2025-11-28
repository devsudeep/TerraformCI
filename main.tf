terraform {
  required_version = ">=1.10.2"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #   version = "~>3.43.0"
    }
  }
}
terraform {
  cloud {

    organization = "krishna-terraform"

    workspaces {
      name = "remotestate"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform"
  location = "Central India"
}

resource "azurerm_storage_account" "sa" {
  name                     = "stterraformsa1234"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
