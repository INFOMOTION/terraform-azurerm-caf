resource "azurecaf_name" "cafname" {
  name          = var.settings.name
  resource_type = "azurerm_data_factory_linked_service_data_lake_storage_gen2"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "linked_service_data_lake_storage_gen2" {
  name                     = try(var.settings.useprefix, true) == true ? azurecaf_name.cafname.result : var.settings.name
  resource_group_name      = var.resource_group_name
  data_factory_id          = var.data_factory_id

  description              = try(var.settings.description, null)
  integration_runtime_name = try(var.settings.integration_runtime_name, var.integration_runtime_name)
  annotations              = try(var.settings.annotations, null)
  parameters               = try(var.settings.parameters, null)
  additional_properties    = try(var.settings.additional_properties, null)
  url                      = try(var.settings.url, var.storage_account.primary_dfs_endpoint)
  storage_account_key      = try(var.settings.use_managed_identity, var.settings.service_principal_id, false) == false ? try(
    var.storage_account.primary_access_key,var.settings.storage_account_key, null) : null
  use_managed_identity     = try(var.settings.use_managed_identity, null)
  service_principal_id     = try(var.settings.service_principal_id, null)
  service_principal_key    = try(var.settings.service_principal_key, null)
  tenant                   = try(var.settings.tenant_id, null)
  
}