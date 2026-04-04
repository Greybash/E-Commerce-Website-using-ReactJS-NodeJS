variable "cluster_name" {
    default = "E-commerce"
}
variable "dns_prefix" {
    default = "ecommerce-aks"
}
variable "location" {
    default = "South India"
}
variable "resource_group_name" {
    default = "test"
}


variable "node_count" {
  default = 2
}

variable "vm_size" {
  default = "Standard_D2ls_v5"
}

variable "kubernetes_version" {
  default = null
}



variable "tags" {
  type = map(string)
}

variable "nodepool_tags" {
  type = map(string)
}