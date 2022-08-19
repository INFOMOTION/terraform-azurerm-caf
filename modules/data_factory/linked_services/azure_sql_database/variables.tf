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
  description = "(Required) The name of the resource group in which to create the Data Factory Linked Service Azure SQL Database. Changing this forces a new resource to be created."
}
variable "data_factory_id" {
  description = "(Required) The Data Factory name in which to associate the Linked Service with. Changing this forces a new resource to be created."
}
variable "integration_runtime_name" {
  description = "(Optional) The integration runtime reference to associate with the Data Factory Linked Service."
}
variable "connection_string" {
  description = "(Optional) The connection string in which to authenticate with Azure SQL Database. Exactly one of either connection_string or key_vault_connection_string is required."
  default = null
}
variable "key_vault_connection_string" {
  description = "(Required) A key_vault_connection_string block as defined below. Use this argument to store Azure SQL Database connection string in an existing Key Vault. It needs an existing Key Vault Data Factory Linked Service. Exactly one of either connection_string or key_vault_connection_string is required."
  default = null
}
variable "key_vault_password" {
  description = "(Optional) A key_vault_password block as defined below. Use this argument to store SQL Server password in an existing Key Vault. It needs an existing Key Vault Data Factory Linked Service."
  default = null
}
