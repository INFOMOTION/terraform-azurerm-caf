resource "azurecaf_name" "cafname" {
  name          = var.settings.name
  resource_type = "azurerm_data_factory_linked_service_key_vault"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_data_factory_linked_service_key_vault" "linked_service_key_vault" {
  name                = try(var.settings.useprefix, true) == true ? azurecaf_name.cafname.result : var.settings.name
  resource_group_name = var.resource_group_name
  data_factory_id     = var.data_factory_id
  key_vault_id        = var.key_vault_id

  description              = try(var.settings.description, null)
  integration_runtime_name = try(var.settings.integration_runtime_name, var.integration_runtime_name)
  annotations              = try(var.settings.annotations, null)
  parameters               = try(var.settings.parameters, null)
  additional_properties    = try(var.settings.additional_properties, null)

}
