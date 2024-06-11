output "storage_account_name" {
  value = azurerm_storage_account.main.name
}

output "account_key" {
  value = azurerm_storage_account.main.primary_access_key
}

output "storage_account_id" {
  value = azurerm_storage_account.main.id
}
