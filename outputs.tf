##-----------------------------------------------------------------------------
## Subnet
##-----------------------------------------------------------------------------
output "subnet_ids" {
  value       = { for k, s in azurerm_subnet.subnet : k => s.id }
  description = "Map of subnet names to their IDs."
}

output "subnet_names" {
  value       = { for k, s in azurerm_subnet.subnet : k => s.name }
  description = "Map of subnet names to their names."
}

output "subnet_address_prefixes" {
  value       = { for k, s in azurerm_subnet.subnet : k => s.address_prefixes }
  description = "Map of subnet names to their address prefixes."
}

##-----------------------------------------------------------------------------
## Public IP
##-----------------------------------------------------------------------------
output "public_ip_addresses" {
  value       = { for k, pip in module.nat_gateway : k => pip.public_ip_addresses }
  description = "Map of NAT Gateway names to their associated public IP addresses."
}

output "public_ip_ids" {
  value       = { for k, pip in module.nat_gateway : k => pip.public_ip_ids }
  description = "Map of NAT Gateway names to their associated public IP resource IDs."
}

##-----------------------------------------------------------------------------
## Net Gateway
##-----------------------------------------------------------------------------
output "nat_gateway_ids" {
  value       = { for k, v in module.nat_gateway : k => v.nat_gateway_ids }
  description = "Map of NAT Gateway names to their IDs."
}

output "nat_gateway_names" {
  value       = { for k, n in module.nat_gateway : k => n.nat_gateway_names }
  description = "Map of NAT Gateway names to their names."
}

##-----------------------------------------------------------------------------
## Route table
##-----------------------------------------------------------------------------
output "route_table_ids" {
  value       = { for k, r in module.route_table : k => r.route_table_ids }
  description = "Map of route table names to their IDs."
}

output "route_table_names" {
  value       = { for k, r in module.route_table : k => r.route_table_names }
  description = "Map of route table names to their names."
}

output "subnet_id" {
  description = "The resource ID"
  value       = azurerm_subnet.subnet.id
}

