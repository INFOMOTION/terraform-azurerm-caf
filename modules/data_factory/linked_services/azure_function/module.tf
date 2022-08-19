resource "azurecaf_name" "cafname" {
  name          = var.settings.name
  resource_type = "azurerm_data_factory_linked_service_azure_function"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}
resource "azurerm_data_factory_linked_service_azure_function" "linked_service_azure_function" {
  name                     = try(var.settings.useprefix, true) == true ? azurecaf_name.cafname.result : var.settings.name
  resource_group_name      = var.resource_group_name
  data_factory_id          = var.data_factory_id
  description              = try(var.settings.description, null)
  integration_runtime_name = try(var.settings.integration_runtime_name, var.integration_runtime_name, null)
  annotations              = try(var.settings.annotations, null)
  parameters               = try(var.settings.parameters, null)
  additional_properties    = try(var.settings.additional_properties, null)
  url                      = try(var.settings.url, var.url)
  key                      = try(var.key_vault_key.linked_service_name, null) != null && try(var.key_vault_key.secret_name, null) != null ? null : try(var.key, null)

  dynamic "key_vault_key" {
    for_each = try(var.key_vault_key.linked_service_name, null) != null && try(var.key_vault_key.secret_name, null) != null ? [var.key_vault_key] : []
    content {
      linked_service_name = key_vault_key.value.linked_service_name
      secret_name         = key_vault_key.value.secret_name
    }
  }
}