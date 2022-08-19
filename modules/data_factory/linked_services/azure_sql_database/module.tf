resource "azurecaf_name" "cafname" {
  name          = var.settings.name
  resource_type = "azurerm_data_factory_linked_service_azure_sql_database"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_data_factory_linked_service_azure_sql_database" "linked_service_azure_sql_database" {
  name                     = try(var.settings.useprefix, true) == true ? azurecaf_name.cafname.result : var.settings.name
  resource_group_name      = var.resource_group_name
  data_factory_id          = var.data_factory_id
  # Use Connection String only if not empty and if no keyvault connection string is provided.
  connection_string        = try(var.key_vault_connection_string.linked_service_name, null) != null && try(var.key_vault_connection_string.secret_name, null) != null ? null : try(var.connection_string, null)
  use_managed_identity     = try(var.settings.use_managed_identity, null)
  service_principal_id     = try(var.settings.use_managed_identity, false) ? null : var.settings.service_principal_id
  service_principal_key    = try(var.settings.use_managed_identity, false) ? null : var.settings.service_principal_key
  tenant_id                = try(var.settings.tenant_id, null)
  description              = try(var.settings.description, null)
  integration_runtime_name = try(var.settings.integration_runtime_name, var.integration_runtime_name)
  annotations              = try(var.settings.annotations, null)
  parameters               = try(var.settings.parameters, null)
  additional_properties    = try(var.settings.additional_properties, null)

  dynamic "key_vault_connection_string" {
    for_each = try(var.key_vault_connection_string.linked_service_name, null) != null && try(var.key_vault_connection_string.secret_name, null) != null ? [var.key_vault_connection_string] : []
   
    content {
      linked_service_name = key_vault_connection_string.value.linked_service_name
      secret_name         = key_vault_connection_string.value.secret_name
    }
  }
  dynamic "key_vault_password" {
    for_each = try(var.key_vault_password.linked_service_name,null) != null && try(var.key_vault_password.secret_name, null) != null ? [var.key_vault_password] : []

    content {
      linked_service_name = key_vault_password.value.linked_service_name
      secret_name         = key_vault_password.value.secret_name
    }
  }
}
