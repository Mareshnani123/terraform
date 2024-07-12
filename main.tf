terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features {

  }
  skip_provider_registration = true

}
resource "azurerm_virtual_network" "network1" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = var.virtual_network
  address_space       = ["10.0.0.0/16"]
  tags = {
    environment = "dev"
    work        = "production"
  }
  lifecycle {
    ignore_changes = [tags]
  }

}
resource "azurerm_subnet" "subnet1" {
  address_prefixes     = ["10.0.0.0/24"]
  virtual_network_name = azurerm_virtual_network.network1.name
  resource_group_name  = var.resource_group_name
  name                 = "${var.virtual_network}-${var.subnet_name}"

}
