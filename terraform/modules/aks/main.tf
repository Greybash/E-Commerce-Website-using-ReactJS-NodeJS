resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix    
  


  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "nodepool1"
    node_count = var.node_count
    vm_size    = var.vm_size

    tags = var.nodepool_tags
  }

  identity {
    type = "SystemAssigned"
  }

resource "tls_private_key" "aks_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

linux_profile {
  admin_username = "azureuser"

  ssh_key {
    key_data = tls_private_key.aks_ssh.public_key_openssh
  }
}

  network_profile {
    network_plugin = "azure"
  }

  tags = var.tags
}