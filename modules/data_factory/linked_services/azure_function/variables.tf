variable "global_settings" {
  description = "Global settings object (see module README.md)"
}
variable "client_config" {
  description = "Client configuration object (see module README.md)."
}
variable "settings" {
  description = "Used for general parameter."
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Data Factory Linked Service. Changing this forces a new resource."
}
variable "data_factory_id" {
  description = "(Required) The Data Factory name in which to associate the Linked Service with. Changing this forces a new resource."
}
variable "integration_runtime_name" {
  description = "(Optional) The integration runtime reference to associate with the Data Factory Linked Service."
}
variable "url" {
  description = "(Required) The url of the Azure Function."
}
variable "key" {
  description = "(Optional) The system key of the Azure Function. Exactly one of either key or key_vault_key is required"
  default = null
}
variable "key_vault_key" {
  description = "(Optional) Use this Argument to store the system key of the Azure Function in an existing Key Vault. It needs an existing Key Vault Data Factory Linked Service. Exactly one of either key or key_vault_key is required."
  default = null
}