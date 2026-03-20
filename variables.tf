##-----------------------------------------------------------------------------
## Labels
##-----------------------------------------------------------------------------
variable "repository" {
  type        = string
  default     = "https://github.com/terraform-az-modules/terraform-azure-subnet.git"
  description = "Terraform current module repo"

  validation {
    condition     = can(regex("^https://", var.repository))
    error_message = "The module-repo value must be a valid Git repo link."
  }
}

variable "environment" {
  type        = string
  default     = null
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(string)
  default     = ["name", "environment", "location"]
  description = "The order of labels used to construct resource names or tags. If not specified, defaults to ['name', 'environment', 'location']."
}

variable "managedby" {
  type        = string
  default     = "terraform-az-modules"
  description = "ManagedBy, eg 'terraform-az-modules'."
}

variable "deployment_mode" {
  type        = string
  default     = "terraform"
  description = "Specifies how the infrastructure/resource is deployed"
}

variable "extra_tags" {
  type        = map(string)
  default     = null
  description = "Variable to pass extra tags."
}

variable "enable" {
  type        = bool
  default     = true
  description = "Flag to control the module creation."
}

variable "resource_group_name" {
  type        = string
  default     = null
  description = "The name of an existing resource group to be imported."
}

variable "location" {
  type        = string
  default     = ""
  description = "The location/region where the virtual network is created."
}

##-----------------------------------------------------------------------------
## Subnet
##-----------------------------------------------------------------------------
variable "subnets" {
  type = list(object({
    name                          = string
    subnet_prefixes               = list(string)
    nat_gateway_name              = optional(string)
    route_table_name              = optional(string)
    nsg_association               = optional(bool, false)
    service_endpoints             = optional(list(string), [])
    service_endpoint_policy_ids   = optional(list(string), [])
    private_link_service_policies = optional(bool, true)
    private_endpoint_policies     = optional(string, "Enabled")
    default_outbound_access       = optional(bool, true)
    network_security_group_id     = optional(string, null)
    delegations = optional(list(object({
      name = string
      service_delegations = list(object({
        name    = string
        actions = list(string)
      }))
    })), [])
  }))
  default     = []
  description = "List of subnets to create"
}

variable "virtual_network_name" {
  type        = string
  default     = null
  description = "Name of the virtual network"
}

##-----------------------------------------------------------------------------
## Nat Gateway
##-----------------------------------------------------------------------------
variable "nat_gateways" {
  type = list(object({
    name                     = string
    sku_name                 = optional(string, "Standard")
    nat_gateway_idle_timeout = optional(number, 4)
    zones                    = optional(list(string), [])
  }))
  default     = []
  description = "List of NAT Gateways to create"
}

variable "enable_nat_gateway" {
  type        = bool
  default     = false
  description = "Flag to control nat gateway creation."
}

##-----------------------------------------------------------------------------
## Route Table
##-----------------------------------------------------------------------------
variable "route_tables" {
  type = list(object({
    name                          = string
    bgp_route_propagation_enabled = optional(bool, false)
    routes = optional(list(object({
      name                   = string
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = optional(string)
    })), [])
  }))
  default     = []
  description = "List of route tables with their configuration."
}

variable "enable_route_table" {
  type        = bool
  default     = false
  description = "Flag to control route table creation."
}
