module "resource_group" {
source = "../azurerm_resource_group"
for_each = var.resource_groups
resource_group_name = each.value.name
location = each.value.location
}

# module "storage_account" {
# source = "../azurerm_storage_account"
# for_each = var.storage_accounts
# storage_account_name = each.value.name
# resource_group_name = module.resource_group[each.key].name
# location = module.resource_group[each.key].location
# }
module "acr" {
source = "../azurerm_acr"
for_each = var.acrs
acr_name = each.value.name
resource_group_name = module.resource_group[each.key].name
location = module.resource_group[each.key].location
}
module "aks" {
source = "../azurerm_aks"
for_each = var.aks_clusters
aks_name = each.value.name
node_count = each.value.node_count
vm_size = each.value.vm_size
resource_group_name = module.resource_group[each.key].name
location = module.resource_group[each.key].location
}

# module "vnet" {
# source = "../azurerm_vnet"
# for_each = var.vnets
# vnet_name          = each.value.vnet_name
# location           = each.value.location
# resource_group_name = each.value.resource_group_name
# address_space      = each.value.address_space
# }


# module "subnet" {
#   source = "../azurerm_subnet"

#   for_each = var.subnets

#   subnet_name          = each.value.subnet_name
#   resource_group_name  = each.value.resource_group_name
#   virtual_network_name = each.value.virtual_network_name
#   address_prefixes     = each.value.address_prefixes
# }
# module "nic" {
#   source = "../azurerm_nic"

#   for_each = var.nics

#   nic_name            = each.value.nic_name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name
#   subnet_id           = module.subnet[each.value.subnet_key].subnet_id
# }

# module "vm" {
#   source = "../azurerm_vm"

#   for_each = var.vms

#   vm_name             = each.value.vm_name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name
#   vm_size             = each.value.vm_size

#   nic_id = module.nic[each.value.nic_key].nic_id

#   admin_username = each.value.admin_username
#   admin_password = each.value.admin_password
# }