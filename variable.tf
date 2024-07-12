variable "resource_group_name" {
  default = "kml_rg_main-dca21aa54a59438b"

}
variable "location" {
  default = "eastus"

}

variable "virtual_network" {
  default = "my-vm-network1"
}
variable "subnet_name" {
  type        = string
  description = "fetch string value from prompt"
}
