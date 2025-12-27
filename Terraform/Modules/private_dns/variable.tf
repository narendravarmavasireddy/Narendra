variable "rg_name" {
  description = "Resource group name where private DNS zones will be created"
  type        = string
}

variable "location" {
  description = "Azure region (not required by DNS zones, but kept for consistency)"
  type        = string
}

variable "vnet_id" {
  description = "Virtual network ID to link with private DNS zones"
  type        = string
}

variable "private_dns_zones" {
  description = "Map of Private DNS zones to create and link"
  type        = map(string)
}
