provider "azurerm" {
  features {}
}

locals {
  name        = "app"
  environment = "test"
  label_order = ["name", "environment", "location"]
}

##-----------------------------------------------------------------------------
## Resource Group module call
## Resource group in which all resources will be deployed.
##-----------------------------------------------------------------------------
module "resource_group" {
  source      = "terraform-az-modules/resource-group/azure"
  version     = "1.0.1"
  name        = local.name
  environment = local.environment
  label_order = local.label_order
  location    = "northeurope"
}

##-----------------------------------------------------------------------------
## Virtual Network module call.
##-----------------------------------------------------------------------------
module "vnet" {
  source              = "terraform-az-modules/vnet/azure"
  version             = "1.0.1"
  name                = local.name
  environment         = local.environment
  label_order         = local.label_order
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_spaces      = ["10.0.0.0/16"]
}

##-----------------------------------------------------------------------------
## Subnet module configuration with advanced features
##-----------------------------------------------------------------------------
module "subnets" {
  source               = "../../"
  environment          = local.environment
  label_order          = local.label_order
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  virtual_network_name = module.vnet.vnet_name

  subnets = [
    # Subnet 1: Delegated subnet 
    {
      name              = "subnet1"
      subnet_prefixes   = ["10.0.1.0/24"]
      service_endpoints = ["Microsoft.Storage"]
      delegations = [
        {
          name = "delegation1"
          service_delegations = [
            {
              name    = "Microsoft.ContainerInstance/containerGroups"
              actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
            }
          ]
        }
      ]
    },
    # Subnet 2: azure Firewall subnet 
    {
      name            = "AzureFirewallSubnet"
      subnet_prefixes = ["10.0.2.0/24"]
    }
  ]
}