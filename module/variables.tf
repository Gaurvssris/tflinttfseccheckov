variable "resource_groups" {

  type = map(object({
    name     = string
    location = string
  }))

}

variable "storage_accounts" {

  type = map(object({
    name = string
  }))

}
variable "acrs" {
type = map(object({
name = string
}))
}
variable "aks_clusters" {
type = map(object({
name       = string
node_count = number
vm_size    = string
}))
}
variable "vnets" {
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    subnet_name          = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "nics" {
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    subnet_key          = string
  }))
}

variable "vms" {
  type = map(object({
    vm_name             = string
    location            = string
    resource_group_name = string
    vm_size             = string
    nic_key             = string
    admin_username      = string
    admin_password      = string
  }))
}