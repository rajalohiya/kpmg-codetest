# modules/app_service_plan/main.tf

resource "azurerm_app_service_plan" "main" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "elastic"

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}
