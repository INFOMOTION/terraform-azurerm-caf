terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
  }

}

locals {
  location            = can(var.settings.location) ? var.settings.location : var.resource_groups[try(var.settings.resource_group.lz_key, var.client_config.landingzone_key)][try(var.settings.resource_group.key, var.settings.resource_group_key)].location
  resource_group_name = can(var.settings.resource_group_name) || can(var.settings.resource_group.name) ? try(var.settings.resource_group_name, var.settings.resource_group.name) : var.resource_groups[try(var.settings.resource_group.lz_key, var.client_config.landingzone_key)][try(var.settings.resource_group_key, var.settings.resource_group.key)].name
}