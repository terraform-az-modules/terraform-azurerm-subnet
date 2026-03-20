##-----------------------------------------------------------------------------
## Vnet
##-----------------------------------------------------------------------------
output "vnet_id" {
  value       = module.vnet.vnet_id
  description = "The ID of the virtual network."
}

output "vnet_name" {
  value       = module.vnet.vnet_name
  description = "The name of the virtual network."
}

output "vnet_address_space" {
  value       = module.vnet.vnet_address_space
  description = "The address space of the virtual network."
}

##-----------------------------------------------------------------------------
## Subnet
##-----------------------------------------------------------------------------
output "subnet_ids" {
  value       = module.subnets.subnet_ids
  description = "Map of subnet names to their IDs."
}

##-----------------------------------------------------------------------------
## Resource Group
##-----------------------------------------------------------------------------
output "resource_group_name" {
  value       = module.resource_group.resource_group_name
  description = "The name of the resource group."
}

output "resource_group_location" {
  value       = module.resource_group.resource_group_location
  description = "The Azure location of the resource group."
}

##-----------------------------------------------------------------------------
## Route Table
##-----------------------------------------------------------------------------
output "route_table_ids" {
  value       = module.subnets.route_table_ids
  description = "Map of route table names to their IDs."
}
