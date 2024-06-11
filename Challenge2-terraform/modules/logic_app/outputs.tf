# modules/logic_app/outputs.tf

output "logic_app_id" {
  description = "The ID of the Logic App."
  value       = azurerm_logic_app_standard.main.id
}

output "private_endpoint_id" {
  description = "The ID of the private endpoint."
  value       = azurerm_private_endpoint.main.id
}
