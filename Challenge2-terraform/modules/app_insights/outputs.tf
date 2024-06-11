# modules/app_insights/outputs.tf

output "app_insights_id" {
  description = "The ID of the Application Insights."
  value       = azurerm_application_insights.main.id
}

output "instrumentation_key" {
  description = "The instrumentation key of the Application Insights."
  value       = azurerm_application_insights.main.instrumentation_key
}

output "connection_string" {
  description = "The instrumentation key of the Application Insights."
  value       = azurerm_application_insights.main.connection_string
}


