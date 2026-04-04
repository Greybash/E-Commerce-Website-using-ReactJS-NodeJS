terraform {
  backend "azurerm" {
    resource_group_name  = "test"
    storage_account_name = "tfstateprem"
    container_name       = "tfstate"
    key                  = "aks/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "E-commerce-rg"
  location = "South India"
}

module "aks" {
  source = "./modules/aks"

  cluster_name        = "E-commerce"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
    dns_prefix          = "ecommerce-aks"


  node_count = 2
  vm_size    = "Standard_D2ls_v5"

  ssh_public_key = file("~/.ssh/id_rsa.pub")

  tags = {
    "Resource Owner"        = "Prem"
    "Resource Group Owner"  = "Prem"
  }

  nodepool_tags = {
    "Resource Owner"        = "Prem"
    "Resource Group Owner"  = "Prem"
  }
}