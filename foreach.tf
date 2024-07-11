terraform {
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
    features {}
    skip_provider_registration = true
}
variable "storage_account" {
    default = {
        mydockerv="eastus"
        mydockerv1="westus"
        mydockerv2="centralus"
    }
  
}
variable "resource_group_name" {
    default = "kml_rg_main-4b60cf4ea4694aa7"
  
}
resource "azurerm_storage_account" "happy" {
      for_each = var.storage_account
      name = each.key
      resource_group_name = var.resource_group_name
      location = each.value
      account_replication_type = "LRS"
      account_tier = "Standard"
      access_tier = "Cool"
}
