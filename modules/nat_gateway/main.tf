##-----------------------------------------------------------------------------
## Tagging Module – Applies standard tags to all resources
##-----------------------------------------------------------------------------
module "labels" {
  source          = "terraform-az-modules/labels/azure"
  version         = "1.0.0"
  name            = var.name
  location        = var.location
  environment     = var.environment
  managedby       = var.managedby
  label_order     = var.label_order
  repository      = var.repository
  deployment_mode = var.deployment_mode
  extra_tags      = var.extra_tags
}

##-----------------------------------------------------------------------------
## Public IP for NAT Gateway
##-----------------------------------------------------------------------------
resource "azurerm_public_ip" "pip" {
  name                = var.resource_position_prefix ? format("pip-ng-%s", module.labels.id) : format("%s-pip-ng", module.labels.id)
  allocation_method   = var.allocation_method
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  tags                = module.labels.tags
}

##-----------------------------------------------------------------------------
## NAT Gateway 
##-----------------------------------------------------------------------------
resource "azurerm_nat_gateway" "natgw" {
  name                    = var.resource_position_prefix ? format("ng-%s", module.labels.id) : format("%s-ng", module.labels.id)
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku_name                = var.sku
  idle_timeout_in_minutes = var.nat_gateway_idle_timeout
  zones                   = var.zones
  tags                    = module.labels.tags
}

##-----------------------------------------------------------------------------
## NAT Gateway Public IP Association
##-----------------------------------------------------------------------------
resource "azurerm_nat_gateway_public_ip_association" "pip_assoc" {
  nat_gateway_id       = azurerm_nat_gateway.natgw.id
  public_ip_address_id = azurerm_public_ip.pip.id
}
