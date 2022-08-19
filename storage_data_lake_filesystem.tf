module "data_lake_filesystems" {
  source   = "./modules/storage_account/data_lake_filesystem"
  for_each = local.storage.storage_data_lake_filesystems
  
  storage_account_id = can(each.value.storage_account.id) || can(each.value.storage_account_id) ? try(each.value.storage_account.id, each.value.storage_account_id) : local.combined_objects_storage_accounts[try(each.value.storage_account.lz_key, local.client_config.landingzone_key)][try(each.value.storage_account.key, each.value.storage_account_key)].id
  settings           = each.value
}
output "storage_data_lake_filesystems" {
  value = module.data_lake_filesystems
}
