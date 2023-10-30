output "id" {
  description = "The ID of the Cognitive Service Account."
  value       = azurerm_cognitive_account.service.id
}

output "endpoint" {
  description = "The endpoint used to connect to the Cognitive Service Account."
  value       = azurerm_cognitive_account.service.endpoint
}

output "primary_access_key" {
  description = "The primary access key used to connect to the Cognitive Service Account."
  value       = azurerm_cognitive_account.service.primary_access_key
}

output "secondary_access_key" {
  description = "The secondary access key used to connect to the Cognitive Service Account."
  value       = azurerm_cognitive_account.service.secondary_access_key
}