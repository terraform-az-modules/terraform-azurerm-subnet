##-----------------------------------------------------------------------------
## Public IP
##-----------------------------------------------------------------------------
output "public_ip_addresses" {
  value       = azurerm_public_ip.pip.ip_address
  description = "The actual allocated public IPv4 address for the Azure Public IP resource."
}

output "public_ip_ids" {
  value       = azurerm_public_ip.pip.id
  description = "The unique Azure Resource Manager identifier for the Public IP resource."
}

##-----------------------------------------------------------------------------
## Net Gateway
##-----------------------------------------------------------------------------
output "nat_gateway_ids" {
  value       = azurerm_nat_gateway.natgw.id
  description = "The ID of the Azure NAT Gateway created."
}

output "nat_gateway_names" {
  value       = azurerm_nat_gateway.natgw.name
  description = "The name of the Azure NAT Gateway resource."
}

output "pip_ip_address" {
  description = "The address of the resource"
  value       = azurerm_public_ip.pip_ip.address
}

