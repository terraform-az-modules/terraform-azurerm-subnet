##-----------------------------------------------------------------------------
## Route table
##-----------------------------------------------------------------------------
output "route_table_ids" {
  value       = azurerm_route_table.rt.id
  description = "The ID of the route table resource."
}

output "route_table_names" {
  value       = azurerm_route_table.rt.name
  description = "The name of the route table resource."
}
