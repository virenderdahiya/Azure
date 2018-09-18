resource "azurerm_network_security_group" "myResourceGroup" {
    name                = "myNetworkSecurityGroup"
    location            = "westus"
    resource_group_name = "${azurerm_resource_group.myResourceGroup.name}"

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags {
        environment = "Terraform Demo"
    }
}
