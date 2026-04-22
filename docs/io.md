## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| deployment\_mode | Specifies how the infrastructure/resource is deployed | `string` | `"terraform"` | no |
| enable | Flag to control the module creation. | `bool` | `true` | no |
| enable\_nat\_gateway | Flag to control nat gateway creation. | `bool` | `false` | no |
| enable\_route\_table | Flag to control route table creation. | `bool` | `false` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `null` | no |
| extra\_tags | Variable to pass extra tags. | `map(string)` | `null` | no |
| label\_order | The order of labels used to construct resource names or tags. If not specified, defaults to ['name', 'environment', 'location']. | `list(string)` | <pre>[<br>  "name",<br>  "environment",<br>  "location"<br>]</pre> | no |
| location | The location/region where the virtual network is created. | `string` | `""` | no |
| managedby | ManagedBy, eg 'terraform-az-modules'. | `string` | `"terraform-az-modules"` | no |
| nat\_gateways | List of NAT Gateways to create | <pre>list(object({<br>    name                     = string<br>    sku_name                 = optional(string, "Standard")<br>    nat_gateway_idle_timeout = optional(number, 4)<br>    zones                    = optional(list(string), [])<br>  }))</pre> | `[]` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/terraform-az-modules/terraform-azure-subnet.git"` | no |
| resource\_group\_name | The name of an existing resource group to be imported. | `string` | `null` | no |
| route\_tables | List of route tables with their configuration. | <pre>list(object({<br>    name                          = string<br>    bgp_route_propagation_enabled = optional(bool, false)<br>    routes = optional(list(object({<br>      name                   = string<br>      address_prefix         = string<br>      next_hop_type          = string<br>      next_hop_in_ip_address = optional(string)<br>    })), [])<br>  }))</pre> | `[]` | no |
| subnets | List of subnets to create | <pre>list(object({<br>    name                          = string<br>    subnet_prefixes               = list(string)<br>    nat_gateway_name              = optional(string)<br>    route_table_name              = optional(string)<br>    nsg_association               = optional(bool, false)<br>    service_endpoints             = optional(list(string), [])<br>    service_endpoint_policy_ids   = optional(list(string), [])<br>    private_link_service_policies = optional(bool, true)<br>    private_endpoint_policies     = optional(string, "Enabled")<br>    default_outbound_access       = optional(bool, true)<br>    network_security_group_id     = optional(string, null)<br>    delegations = optional(list(object({<br>      name = string<br>      service_delegations = list(object({<br>        name    = string<br>        actions = list(string)<br>      }))<br>    })), [])<br>  }))</pre> | `[]` | no |
| virtual\_network\_name | Name of the virtual network | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| nat\_gateway\_ids | Map of NAT Gateway names to their IDs. |
| nat\_gateway\_names | Map of NAT Gateway names to their names. |
| public\_ip\_addresses | Map of NAT Gateway names to their associated public IP addresses. |
| public\_ip\_ids | Map of NAT Gateway names to their associated public IP resource IDs. |
| route\_table\_ids | Map of route table names to their IDs. |
| route\_table\_names | Map of route table names to their names. |
| subnet\_address\_prefixes | Map of subnet names to their address prefixes. |
| subnet\_ids | Map of subnet names to their IDs. |
| subnet\_names | Map of subnet names to their names. |

