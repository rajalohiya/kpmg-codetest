# modules/logic_app/main.tf

resource "azurerm_logic_app_standard" "main" {
  name                = var.logic_app_name
  location            = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_key
  https_only                 = true
  version                    = "~4"

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"               = var.functions_worker_runtime
    "WEBSITE_NODE_DEFAULT_VERSION"           = var.website_node_version
    "APPINSIGHTS_INSTRUMENTATIONKEY"         = var.app_insights_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"  = var.app_insights_conn_string
  }
  site_config {
    use_32_bit_worker_process        = true
    ftps_state                       = "Disabled"
    websockets_enabled               = false
    min_tls_version                  = "1.2"
    runtime_scale_monitoring_enabled = false
    vnet_route_all_enabled           = true
    public_network_access_enabled    = false
  }
  
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_private_endpoint" "main" {
  name                = "pe-${azurerm_logic_app_standard.main.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${azurerm_logic_app_standard.main.name}-connection"
    private_connection_resource_id = azurerm_logic_app_standard.main.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}
