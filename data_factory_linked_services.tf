##### azurerm_data_factory_linked_service_azure_blob_storage
module "data_factory_linked_service_azure_blob_storage" {
  source = "./modules/data_factory/linked_services/azure_blob_storage"

  for_each = local.data_factory.linked_services.azure_blob_storage

  global_settings     = local.global_settings
  client_config       = local.client_config
  settings            = each.value
  resource_group_name = can(each.value.resource_group.name) || can(each.value.resource_group_name) ? try(each.value.resource_group.name, each.value.resource_group_name) : local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)].name
  data_factory_id     = can(each.value.data_factory.id) || can(each.value.data_factory_id) ? try(each.value.data_factory.id, each.value.data_factory_id) : local.combined_objects_data_factory[try(each.value.data_factory.lz_key, local.client_config.landingzone_key)][try(each.value.data_factory_key, each.value.data_factory.key)].id
  storage_account     = can(each.value.storage_account_name) ? each.value.storage_account_name : local.combined_objects_storage_accounts[try(each.value.storage_account.lz_key, local.client_config.landingzone_key)][try(each.value.storage_account_key, each.value.storage_account.key)]
  
  integration_runtime_name = try(
    coalesce(
      try(local.combined_objects_data_factory_integration_runtime_self_hosted[each.value.integration_runtime.data_factory_integration_runtime_self_hosted.lz_key][each.value.integration_runtime.data_factory_integration_runtime_self_hosted.key].name, null),
      try(local.combined_objects_data_factory_integration_runtime_self_hosted[local.client_config.landingzone_key][each.value.integration_runtime.data_factory_integration_runtime_self_hosted.key].name, null),
      try(each.value.integration_runtime.data_factory_integration_runtime_self_hosted.name, null),
      try(local.combined_objects_data_factory_integration_runtime_azure_ssis[each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.lz_key][each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.key].name, null),
      try(local.combined_objects_data_factory_integration_runtime_azure_ssis[local.client_config.landingzone_key][each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.key].name, null),
      try(each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.name, null)
    ),
  null)
}

output "data_factory_linked_service_azure_blob_storage" {
  value = module.data_factory_linked_service_azure_blob_storage
}
##### azurerm_data_factory_linked_service_data_lake_storage_gen2
module "data_factory_linked_service_data_lake_storage_gen2" {
  source = "./modules/data_factory/linked_services/data_lake_storage_gen2"

  for_each = local.data_factory.linked_services.data_lake_storage_gen2

  global_settings     = local.global_settings
  client_config       = local.client_config
  settings            = each.value
  resource_group_name = can(each.value.resource_group.name) || can(each.value.resource_group_name) ? try(each.value.resource_group.name, each.value.resource_group_name) : local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)].name
  data_factory_id     = can(each.value.data_factory.id) || can(each.value.data_factory_id) ? try(each.value.data_factory.id, each.value.data_factory_id) : local.combined_objects_data_factory[try(each.value.data_factory.lz_key, local.client_config.landingzone_key)][try(each.value.data_factory_key, each.value.data_factory.key)].id
  storage_account     = can(each.value.storage_account_name) ? each.value.storage_account_name : local.combined_objects_storage_accounts[try(each.value.storage_account.lz_key, local.client_config.landingzone_key)][try(each.value.storage_account_key, each.value.storage_account.key)]
  
  integration_runtime_name = try(
    coalesce(
      try(local.combined_objects_data_factory_integration_runtime_self_hosted[each.value.integration_runtime.data_factory_integration_runtime_self_hosted.lz_key][each.value.integration_runtime.data_factory_integration_runtime_self_hosted.key].name, null),
      try(local.combined_objects_data_factory_integration_runtime_self_hosted[local.client_config.landingzone_key][each.value.integration_runtime.data_factory_integration_runtime_self_hosted.key].name, null),
      try(each.value.integration_runtime.data_factory_integration_runtime_self_hosted.name, null),
      try(local.combined_objects_data_factory_integration_runtime_azure_ssis[each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.lz_key][each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.key].name, null),
      try(local.combined_objects_data_factory_integration_runtime_azure_ssis[local.client_config.landingzone_key][each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.key].name, null),
      try(each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.name, null)
    ),
  null)
}

output "data_factory_linked_service_data_lake_storage_gen2" {
  value = module.data_factory_linked_service_data_lake_storage_gen2
}

##### data_factory_linked_service_cosmosdb
module "data_factory_linked_service_cosmosdb" {
  source = "./modules/data_factory/linked_services/cosmosdb"

  for_each = local.data_factory.linked_services.cosmosdb

  global_settings     = local.global_settings
  client_config       = local.client_config
  settings            = each.value
  resource_group_name = can(each.value.resource_group.name) || can(each.value.resource_group_name) ? try(each.value.resource_group.name, each.value.resource_group_name) : local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)].name
  data_factory_id     = can(each.value.data_factory.id) || can(each.value.data_factory_id) ? try(each.value.data_factory.id, each.value.data_factory_id) : local.combined_objects_data_factory[try(each.value.data_factory.lz_key, local.client_config.landingzone_key)][try(each.value.data_factory_key, each.value.data_factory.key)].id
  account_endpoint    = can(each.value.cosmosdb_account.endpoint) ? each.value.cosmosdb_account.endpoint : local.combined_objects_cosmos_dbs[try(each.value.cosmosdb_account.lz_key, local.client_config.landingzone_key)][each.value.cosmosdb_account.key].endpoint
  account_key         = can(each.value.cosmosdb_account.account_key) ? each.value.cosmosdb_account.account_key : local.combined_objects_cosmos_dbs[try(each.value.cosmosdb_account.lz_key, local.client_config.landingzone_key)][each.value.cosmosdb_account.key].primary_key
}

output "data_factory_linked_service_cosmosdb" {
  value = module.data_factory_linked_service_cosmosdb
}

##### data_factory_linked_service_web
module "data_factory_linked_service_web" {
  source = "./modules/data_factory/linked_services/web"

  for_each = local.data_factory.linked_services.web

  global_settings     = local.global_settings
  client_config       = local.client_config
  settings            = each.value
  resource_group_name = can(each.value.resource_group.name) || can(each.value.resource_group_name) ? try(each.value.resource_group.name, each.value.resource_group_name) : local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)].name
  data_factory_id     = can(each.value.data_factory.id) || can(each.value.data_factory_id) ? try(each.value.data_factory.id, each.value.data_factory_id) : local.combined_objects_data_factory[try(each.value.data_factory.lz_key, local.client_config.landingzone_key)][try(each.value.data_factory_key, each.value.data_factory.key)].id
  #connection_string = try(each.value.lz_key, null) == null ? local.combined_objects_cosmos_dbs[local.client_config.landingzone_key][each.value.cosmos_db_key].name : local.combined_objects_cosmos_dbs[each.value.lz_key][each.value.cosmos_db_key].connection_string
}

output "data_factory_linked_service_web" {
  value = module.data_factory_linked_service_web
}

##### data_factory_linked_service_mysql
module "data_factory_linked_service_mysql" {
  source   = "./modules/data_factory/linked_services/mysql"
  for_each = local.data_factory.linked_services.mysql

  global_settings     = local.global_settings
  client_config       = local.client_config
  settings            = each.value
  resource_group_name = can(each.value.resource_group.name) || can(each.value.resource_group_name) ? try(each.value.resource_group.name, each.value.resource_group_name) : local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)].name
  data_factory_id     = can(each.value.data_factory.id) || can(each.value.data_factory_id) ? try(each.value.data_factory.id, each.value.data_factory_id) : local.combined_objects_data_factory[try(each.value.data_factory.lz_key, local.client_config.landingzone_key)][try(each.value.data_factory_key, each.value.data_factory.key)].id
  #connection_string = try(each.value.lz_key, null) == null ? local.combined_objects_cosmos_dbs[local.client_config.landingzone_key][each.value.cosmos_db_key].name : local.combined_objects_cosmos_dbs[each.value.lz_key][each.value.cosmos_db_key].connection_string
}

##### data_factory_linked_service_postgresql
module "data_factory_linked_service_postgresql" {
  source   = "./modules/data_factory/linked_services/postgresql"
  for_each = local.data_factory.linked_services.postgresql

  global_settings     = local.global_settings
  client_config       = local.client_config
  settings            = each.value
  resource_group_name = can(each.value.resource_group.name) || can(each.value.resource_group_name) ? try(each.value.resource_group.name, each.value.resource_group_name) : local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)].name
  data_factory_id     = can(each.value.data_factory.id) || can(each.value.data_factory_id) ? try(each.value.data_factory.id, each.value.data_factory_id) : local.combined_objects_data_factory[try(each.value.data_factory.lz_key, local.client_config.landingzone_key)][try(each.value.data_factory_key, each.value.data_factory.key)].id
  
  #connection_string = try(each.value.lz_key, null) == null ? local.combined_objects_cosmos_dbs[local.client_config.landingzone_key][each.value.cosmos_db_key].name : local.combined_objects_cosmos_dbs[each.value.lz_key][each.value.cosmos_db_key].connection_string
}
output "data_factory_linked_service_postgresql" {
  value = module.data_factory_linked_service_postgresql
}
##### data_factory_linked_service_sql_server
module "data_factory_linked_service_sql_server" {
  source   = "./modules/data_factory/linked_services/sql_server"
  for_each = local.data_factory.linked_services.sql_server

  global_settings     = local.global_settings
  client_config       = local.client_config
  settings            = each.value
  resource_group_name = can(each.value.resource_group.name) || can(each.value.resource_group_name) ? try(each.value.resource_group.name, each.value.resource_group_name) : local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)].name
  data_factory_id     = can(each.value.data_factory.id) || can(each.value.data_factory_id) ? try(each.value.data_factory.id, each.value.data_factory_id) : local.combined_objects_data_factory[try(each.value.data_factory.lz_key, local.client_config.landingzone_key)][try(each.value.data_factory_key, each.value.data_factory.key)].id
  
  #connection_string = try(each.value.lz_key, null) == null ? local.combined_objects_cosmos_dbs[local.client_config.landingzone_key][each.value.cosmos_db_key].name : local.combined_objects_cosmos_dbs[each.value.lz_key][each.value.cosmos_db_key].connection_string
}
output "data_factory_linked_service_sql_server" {
  value = module.data_factory_linked_service_sql_server
}

module "data_factory_linked_service_azure_databricks" {
  source   = "./modules/data_factory/linked_services/azure_databricks"
  for_each = local.data_factory.linked_services.azure_databricks

  global_settings = local.global_settings
  client_config   = local.client_config
  settings        = each.value

  resource_group_name = can(each.value.resource_group.name) || can(each.value.resource_group_name) ? try(each.value.resource_group.name, each.value.resource_group_name) : local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)].name

  integration_runtime_name = try(coalesce(
    try(local.combined_objects_data_factory_integration_runtime_self_hosted[each.value.integration_runtime.data_factory_integration_runtime_self_hosted.lz_key][each.value.integration_runtime.data_factory_integration_runtime_self_hosted.key].name, null),
    try(local.combined_objects_data_factory_integration_runtime_self_hosted[local.client_config.landingzone_key][each.value.integration_runtime.data_factory_integration_runtime_self_hosted.key].name, null),
    try(each.value.integration_runtime.data_factory_integration_runtime_self_hosted.name, null),
    try(local.combined_objects_data_factory_integration_runtime_azure_ssis[each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.lz_key][each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.key].name, null),
    try(local.combined_objects_data_factory_integration_runtime_azure_ssis[local.client_config.landingzone_key][each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.key].name, null),
    try(each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.name, null)
    ), null
  )

  remote_objects = {
    databricks_workspace = local.combined_objects_databricks_workspaces[try(each.value.databricks_workspace.lz_key, local.client_config.landingzone_key)][each.value.databricks_workspace.key]
    data_factory         = local.combined_objects_data_factory[try(each.value.data_factory.lz_key, local.client_config.landingzone_key)][each.value.data_factory.key]
  }
}
output "data_factory_linked_service_azure_databricks" {
  value = module.data_factory_linked_service_azure_databricks
}


module "data_factory_linked_service_key_vault" {
  source = "./modules/data_factory/linked_services/key_vault"

  for_each = local.data_factory.linked_services.key_vault

  global_settings = local.global_settings
  client_config   = local.client_config
  settings        = each.value
  #description           = try(each.value.description, null)
  #annotations           = try(each.value.annotations, null)
  #parameters            = try(each.value.parameters, null)
  #name                  = each.value.name
  #additional_properties = try(each.value.additional_properties, null)

  resource_group_name = can(each.value.resource_group.name) || can(each.value.resource_group_name) ? try(each.value.resource_group.name, each.value.resource_group_name) : local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)].name
  data_factory_id     = can(each.value.data_factory.id) || can(each.value.data_factory_id) ? try(each.value.data_factory.id, each.value.data_factory_id) : local.combined_objects_data_factory[try(each.value.data_factory.lz_key, local.client_config.landingzone_key)][try(each.value.data_factory_key, each.value.data_factory.key)].id
  key_vault_id        = can(each.value.key_vault.id) || can(each.value.key_vault_id) ? try(each.value.key_vault.id, each.value.key_vault_id) : local.combined_objects_keyvaults[try(each.value.key_vault.lz_key, local.client_config.landingzone_key)][try(each.value.key_vault_key, each.value.key_vault.key)].id
  
  integration_runtime_name = try(coalesce(
    try(local.combined_objects_data_factory_integration_runtime_self_hosted[each.value.integration_runtime.data_factory_integration_runtime_self_hosted.lz_key][each.value.integration_runtime.data_factory_integration_runtime_self_hosted.key].name, null),
    try(local.combined_objects_data_factory_integration_runtime_self_hosted[local.client_config.landingzone_key][each.value.integration_runtime.data_factory_integration_runtime_self_hosted.key].name, null),
    try(each.value.integration_runtime.data_factory_integration_runtime_self_hosted.name, null),
    try(local.combined_objects_data_factory_integration_runtime_azure_ssis[each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.lz_key][each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.key].name, null),
    try(local.combined_objects_data_factory_integration_runtime_azure_ssis[local.client_config.landingzone_key][each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.key].name, null),
    try(each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.name, null)
    ), null
  )

}
output "data_factory_linked_service_key_vault" {
  value = module.data_factory_linked_service_key_vault
}


##### data_factory_linked_service_azure_sql_database
module "data_factory_linked_service_azure_sql_database" {
  source = "./modules/data_factory/linked_services/azure_sql_database"

  for_each = local.data_factory.linked_services.azure_sql_database

  global_settings = local.global_settings
  client_config   = local.client_config
  settings        = each.value

  resource_group_name = can(each.value.resource_group.name) || can(each.value.resource_group_name) ? try(each.value.resource_group.name, each.value.resource_group_name) : local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)].name
  data_factory_id     = can(each.value.data_factory.id) ? each.value.data_factory.id : local.combined_objects_data_factory[try(each.value.data_factory.lz_key, local.client_config.landingzone_key)][try(each.value.data_factory.key, each.value.data_factory_key)].id
  
  # Option 1: Pass Connection String directly or get it from MSSQL Database LZ Objects
  connection_string   = can(each.value.connection_string) ? each.value.connection_string : try(local.combined_objects_mssql_databases[try(each.value.mssql_database.lz_key, local.client_config.landingzone_key)][try(each.value.mssql_database.key, each.value.mssql_database_key)].connection_string, null)
  # Option 2: Pass the Linked Key Vault containing the Connection String (Only for Managed Identity)
  key_vault_connection_string = {
    linked_service_name = can(each.value.key_vault_connection_string.linked_service_name) ? each.value.key_vault_connection_string.linked_service_name : try(local.combined_objects_data_factory_linked_service_key_vault[try(each.value.key_vault_connection_string.lz_key, local.client_config.landingzone_key)][each.value.key_vault_connection_string.key].name, null)
    secret_name =  can(each.value.key_vault_connection_string.secret_name) ? each.value.key_vault_connection_string.secret_name : null
  }
  # Option 3: Pass the Linked Key Vault Secret Password (Only for Connection String using SQL Authentication)
  key_vault_password = {
    linked_service_name = can(each.value.key_vault_password.linked_service_name) ? each.value.key_vault_password.linked_service_name : try(local.combined_objects_data_factory_linked_service_key_vault[try(each.value.key_vault_password.lz_key, local.client_config.landingzone_key)][each.value.key_vault_password.key].name, null)
    secret_name =  can(each.value.key_vault_password.secret_name) ? each.value.key_vault_password.secret_name : null
  }
  
  integration_runtime_name = try(coalesce(
    try(local.combined_objects_data_factory_integration_runtime_self_hosted[each.value.integration_runtime.data_factory_integration_runtime_self_hosted.lz_key][each.value.integration_runtime.data_factory_integration_runtime_self_hosted.key].name, null),
    try(local.combined_objects_data_factory_integration_runtime_self_hosted[local.client_config.landingzone_key][each.value.integration_runtime.data_factory_integration_runtime_self_hosted.key].name, null),
    try(each.value.integration_runtime.data_factory_integration_runtime_self_hosted.name, null),
    try(local.combined_objects_data_factory_integration_runtime_azure_ssis[each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.lz_key][each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.key].name, null),
    try(local.combined_objects_data_factory_integration_runtime_azure_ssis[local.client_config.landingzone_key][each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.key].name, null),
    try(each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.name, null)
    ), null
  )

}
output "data_factory_linked_service_azure_sql_database" {
  value = module.data_factory_linked_service_azure_sql_database
}


##### data_factory_linked_service_azure_function
module "data_factory_linked_service_azure_function" {
  source = "./modules/data_factory/linked_services/azure_function"

  for_each = local.data_factory.linked_services.azure_function

  global_settings = local.global_settings
  client_config   = local.client_config
  settings        = each.value

  resource_group_name = can(each.value.resource_group.name) || can(each.value.resource_group_name) ? try(each.value.resource_group.name, each.value.resource_group_name) : local.combined_objects_resource_groups[try(each.value.resource_group.lz_key, local.client_config.landingzone_key)][try(each.value.resource_group_key, each.value.resource_group.key)].name
  data_factory_id     = can(each.value.data_factory.id) ? each.value.data_factory.id : local.combined_objects_data_factory[try(each.value.data_factory.lz_key, local.client_config.landingzone_key)][try(each.value.data_factory.key, each.value.data_factory_key)].id
  
  url = can(each.value.url) || can(each.value.azure_function.url) ? try(each.value.url, each.value.azure_function.url) : try(local.combined_objects_function_apps[try(each.value.azure_function.lz_key, local.client_config.landingzone_key)][try(each.value.azure_function.key, each.value.azure_function_key)].default_hostname, null)
  # Option 1: Pass the Access Key directly or get it from Objects
  key = can(each.value.app_key) || can(each.value.azure_function.app_key) ? try(each.value.app_key, each.value.azure_function.app_key) : try(local.combined_objects_function_apps[try(each.value.azure_function.lz_key, local.client_config.landingzone_key)][try(each.value.azure_function.key, each.value.azure_function_key)].default_function_key, null)
  # Option 2: Pass Key Vault Linked Service information directly or get it from LZ Objects
  key_vault_key = {
    linked_service_name = can(each.value.key_vault_key.linked_service_name) ? each.value.key_vault_key.linked_service_name : try(local.combined_objects_data_factory_linked_service_key_vault[try(each.value.key_vault_key.lz_key, local.client_config.landingzone_key)][each.value.key_vault_key.key].name, null)
    secret_name =  can(each.value.key_vault_key.secret_name) ? each.value.key_vault_key.secret_name : null
  }
  
  integration_runtime_name = try(coalesce(
    try(local.combined_objects_data_factory_integration_runtime_self_hosted[each.value.integration_runtime.data_factory_integration_runtime_self_hosted.lz_key][each.value.integration_runtime.data_factory_integration_runtime_self_hosted.key].name, null),
    try(local.combined_objects_data_factory_integration_runtime_self_hosted[local.client_config.landingzone_key][each.value.integration_runtime.data_factory_integration_runtime_self_hosted.key].name, null),
    try(each.value.integration_runtime.data_factory_integration_runtime_self_hosted.name, null),
    try(local.combined_objects_data_factory_integration_runtime_azure_ssis[each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.lz_key][each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.key].name, null),
    try(local.combined_objects_data_factory_integration_runtime_azure_ssis[local.client_config.landingzone_key][each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.key].name, null),
    try(each.value.integration_runtime.combined_objects_data_factory_integration_runtime_azure_ssis.name, null)
    ), null
  )

}
output "data_factory_linked_service_azure_function" {
  value = module.data_factory_linked_service_azure_function
}