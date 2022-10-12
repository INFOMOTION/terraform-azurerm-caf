output "id" {
  value       = azurerm_function_app.function_app.id
  description = "The ID of the App Service."
}
#output default_site_hostname {
#  value       = azurerm_function_app.function_app.default_site_hostname
#  description = "The Default Hostname associated with the App Service"
#}
output "default_hostname" {
 value       = azurerm_function_app.function_app.default_hostname
 description = "The default hostname associated with the Function App."
}
output "outbound_ip_addresses" {
  value       = azurerm_function_app.function_app.outbound_ip_addresses
  description = "A comma separated list of outbound IP addresses"
}
output "possible_outbound_ip_addresses" {
  value       = azurerm_function_app.function_app.possible_outbound_ip_addresses
  description = "A comma separated list of outbound IP addresses. not all of which are necessarily in use"
}

data "azurerm_function_app_host_keys" "keys" {
  name                = azurerm_function_app.function_app.name
  resource_group_name = azurerm_function_app.function_app.resource_group_name
  depends_on = [
    azurerm_function_app.function_app
  ]
}

output "principal_id" {
  value = azurerm_function_app.function_app.identity.0.principal_id
}

output "default_function_key" {
  value = data.azurerm_function_app_host_keys.keys.default_function_key
  sensitive = true
}