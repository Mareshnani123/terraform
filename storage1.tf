terraform {
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
    }
    random={
      source = "hashicorp/random"
    }
  }
}
resource "random_string" "stincky" {
  length = 5
  upper = false 
  special = false
  
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}
variable "resource_group_name" {
  default = "kml_rg_main-2a8d9a7e72b946e0"
  
}
resource "azurerm_storage_account" "bobby" {
  depends_on = [random_string.stincky]
  resource_group_name = var.resource_group_name
  for_each = {
    "my" = "eastus"
    "boby" = "westus" 
  }
  name = "${each.key}${random_string.stincky.id}"
  location = each.value
  account_replication_type = "LRS"
  account_tier = "Standard"
  
}
resource "azurerm_storage_container" "puppy" {
  for_each = {
  "webapp1" = azurerm_storage_account.bobby["my"].name
    "webapp2" = azurerm_storage_account.bobby["boby"].name
}
  storage_account_name = each.value
  name=each.key  
}

