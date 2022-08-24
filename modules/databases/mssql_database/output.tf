output "id" {
  value = azurerm_mssql_database.mssqldb.id
}

output "name" {
  value = azurerm_mssql_database.mssqldb.name
}

output "server_id" {
  value = azurerm_mssql_database.mssqldb.server_id
}

output "server_name" {
  value = var.server_name
}

output "server_fqdn" {
  value = local.server_name
}

# Custom Connection String Output for usage with ADF. E.g. with Managed Identity
output "connection_string" {
  value = "Integrated Security=False;Encrypt=True;Connection Timeout=30;Data Source=${local.server_name};Initial Catalog=${azurerm_mssql_database.mssqldb.name}"
}