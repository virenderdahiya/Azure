# Configure the Microsoft Azure Provider
provider "azurerm" {
    subscription_id = "54763c35-2aa1-4dc6-aa0d-aa067ba1a195"
    client_id       = "585c4266-d603-4d4f-9325-131dad7e3189"
    client_secret   = "b58a14a7-02c4-4e7b-9c42-814f3c1d4bc2"
    tenant_id       = "14de224a-7de3-48fc-ac9d-19edf0ae266d"
}
resource "azurerm_resource_group" "vmss" {
 name     = "${var.resource_group_name}"
 location = "${var.location}"
 tags     = "${var.tags}"
}

resource "random_string" "fqdn" {
 length  = 6
 special = false
 upper   = false
 number  = false
}

resource "azurerm_virtual_network" "vmss" {
 name                = "vmss-vnet"
 address_space       = ["10.0.0.0/16"]
 location            = "${var.location}"
 resource_group_name = "${azurerm_resource_group.vmss.name}"
 tags                = "${var.tags}"
}

resource "azurerm_subnet" "vmss" {
 name                 = "vmss-subnet"
 resource_group_name  = "${azurerm_resource_group.vmss.name}"
 virtual_network_name = "${azurerm_virtual_network.vmss.name}"
 address_prefix       = "10.0.2.0/24"
}

resource "azurerm_public_ip" "vmss" {
 name                         = "vmss-public-ip"
 location                     = "${var.location}"
 resource_group_name          = "${azurerm_resource_group.vmss.name}"
 public_ip_address_allocation = "static"
 domain_name_label            = "${random_string.fqdn.result}"
 tags                         = "${var.tags}"
>>>>>>> master
}