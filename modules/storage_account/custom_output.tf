output "primary_dfs_endpoint" {
  description = "The endpoint URL for DFS storage in the primary location."
  value       = azurerm_storage_account.stg.primary_dfs_endpoint
  sensitive   = true
}

output "secondary_dfs_endpoint" {
  description = "The endpoint URL for DFS storage in the secondary location."
  value       = azurerm_storage_account.stg.secondary_dfs_endpoint
  sensitive   = true
}
