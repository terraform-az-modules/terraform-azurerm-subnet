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
## Subnet
##-----------------------------------------------------------------------------
output "subnet_ids" {
  value       = module.subnets.subnet_ids
  description = "Map of subnet names to their IDs."
}

##-----------------------------------------------------------------------------
## Public IP
##-----------------------------------------------------------------------------
output "public_ip_addresses" {
  value       = module.subnets.public_ip_addresses
  description = "The IP address value that was allocated."
}

output "public_ip_ids" {
  value       = module.subnets.public_ip_ids
  description = " The ID of this Public IP."
}

##-----------------------------------------------------------------------------
## Net Gateway
##-----------------------------------------------------------------------------
output "nat_gateway_ids" {
  value       = module.subnets.nat_gateway_ids
  description = "Map of NAT Gateway names to their IDs."
}
