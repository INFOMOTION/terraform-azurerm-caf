variable "global_settings" {
  description = "Global settings object (see module README.md)"
}
variable "client_config" {
  description = "Client configuration object (see module README.md)."
}

variable "resource_group_name" {
  description = "The resource group object where to create the resource."
}

variable "location" {
  description = "The location where to create the resource."
}

variable "settings" {}
variable "vnets" {
  default = {}
}
variable "azuread_groups" {
  default = {}
}
variable "managed_identities" {
  default = {}
}
# For diagnostics settings
variable "diagnostics" {
  default = {}
}
variable "base_tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = map(any)
}
variable "private_dns" {
  default = {}
}