
# Custom Connection String for usage with ADF. E.g. with Managed Identity
output "connection_string" {
  value = "Integrated Security=False;Encrypt=True;Connection Timeout=30;Data Source=${local.server_name};Initial Catalog=${azurerm_mssql_database.mssqldb.name}"
}
