##-----------------------------------------------------------------------------
## Subnet – Creates a subnet with optional service endpoints, delegations, etc
##-----------------------------------------------------------------------------
resource "azurerm_subnet" "subnet" {
  for_each                                      = var.enable ? { for subnet in var.subnets : subnet.name => subnet } : {}
  name                                          = each.value.name
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = var.virtual_network_name
  address_prefixes                              = each.value.subnet_prefixes
  service_endpoints                             = lookup(each.value, "service_endpoints", null)
  service_endpoint_policy_ids                   = lookup(each.value, "service_endpoint_policy_ids", null)
  private_link_service_network_policies_enabled = lookup(each.value, "private_link_service_policies", true)
  private_endpoint_network_policies             = lookup(each.value, "private_endpoint_policies", "Enabled")
  default_outbound_access_enabled               = lookup(each.value, "default_outbound_access", true)

  dynamic "delegation" {
    for_each = lookup(each.value, "delegations", [])
    content {
      name = delegation.value.name
      dynamic "service_delegation" {
        for_each = delegation.value.service_delegations
        content {
          name    = service_delegation.value.name
          actions = service_delegation.value.actions
        }
      }
    }
  }
}

##-----------------------------------------------------------------------------
## Route Table – Creates route table with custom routes if required
##-----------------------------------------------------------------------------
module "route_table" {
  source                        = "./modules/route_table"
  for_each                      = var.enable && var.enable_route_table ? { for rt in var.route_tables : rt.name => rt } : {}
  name                          = each.value.name
  environment                   = var.environment
  label_order                   = var.label_order
  location                      = var.location
  managedby                     = var.managedby
  repository                    = var.repository
  deployment_mode               = var.deployment_mode
  resource_group_name           = var.resource_group_name
  bgp_route_propagation_enabled = each.value.bgp_route_propagation_enabled
  routes                        = each.value.routes
  extra_tags                    = var.extra_tags
}

##-----------------------------------------------------------------------------
## NAT Gateway – Creates a nat-gateway if required
##-----------------------------------------------------------------------------
module "nat_gateway" {
  source                   = "./modules/nat_gateway"
  for_each                 = var.enable && var.enable_nat_gateway ? { for ngw in var.nat_gateways : ngw.name => ngw } : {}
  name                     = each.value.name
  environment              = var.environment
  location                 = var.location
  managedby                = var.managedby
  label_order              = var.label_order
  resource_group_name      = var.resource_group_name
  repository               = var.repository
  deployment_mode          = var.deployment_mode
  sku                      = each.value.sku_name
  nat_gateway_idle_timeout = each.value.nat_gateway_idle_timeout
  extra_tags               = var.extra_tags
}

##-----------------------------------------------------------------------------
## Route Table, NAT Gateway and NSG Subnet Association
##-----------------------------------------------------------------------------
resource "azurerm_subnet_route_table_association" "main" {
  for_each = {
    for subnet in var.subnets : subnet.name => subnet
    if var.enable && var.enable_route_table && lookup(subnet, "route_table_name", null) != null
  }
  subnet_id      = azurerm_subnet.subnet[each.key].id
  route_table_id = module.route_table[each.value.route_table_name].route_table_ids
}

resource "azurerm_subnet_nat_gateway_association" "subnet_assoc" {
  for_each = {
    for subnet in var.subnets : subnet.name => subnet
    if var.enable && var.enable_nat_gateway && lookup(subnet, "nat_gateway_name", null) != null
  }
  subnet_id      = azurerm_subnet.subnet[each.key].id
  nat_gateway_id = module.nat_gateway[each.value.nat_gateway_name].nat_gateway_ids
}

resource "azurerm_subnet_network_security_group_association" "nsg_subnet_association" {
  for_each = var.enable ? {
    for subnet in var.subnets : subnet.name => subnet
    if subnet.nsg_association
  } : {}
  subnet_id                 = azurerm_subnet.subnet[each.key].id
  network_security_group_id = each.value.network_security_group_id
}
