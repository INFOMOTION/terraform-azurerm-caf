output "endpoint" {
  description = "The Endpoint URL of the Data Lake Gen2 File System."
  value       = azurerm_storage_data_lake_gen2_filesystem.gen2.id
}

output "id" {
  description = "The ID of the Data Lake Gen2 File System (Necessary for the RBAC Assignments)."
  value = "${var.storage_account_id}/blobServices/default/containers/${var.settings.name}"
}