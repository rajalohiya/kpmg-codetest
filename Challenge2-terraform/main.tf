# main.tf

module "resource_group" {
  source = "./modules/resource_group"

  resource_group_name      = var.resource_group_name
  resource_group_location  = var.resource_group_location
}

module "storage_account" {
  source = "./modules/storage_account"
  resource_group_name  = module.resource_group.resource_group_name
  resource_group_location = module.resource_group.resource_group_location
  storage_account_name = var.storage_account_name
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type
}

module "app_service_plan" {
  source = "./modules/app_service_plan"

  app_service_plan_name = var.app_service_plan_name
  location              = var.location
  resource_group_name   = module.resource_group.resource_group_name
  sku_tier              = var.app_service_plan_sku_tier
  sku_size              = var.app_service_plan_sku_size
}

module "vnet" {
  source = "./modules/vnet"

  vnet_name              = var.vnet_name
  address_space          = var.vnet_address_space
  location               = var.location
  resource_group_name    = module.resource_group.resource_group_name
  subnet_name            = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
}

module "log_analytics" {
  source = "./modules/log_analytics"
  resource_group_name  = module.resource_group.resource_group_name
  location = module.resource_group.resource_group_location
  workspace_name = var.workspace_name
}

module "app_insights" {
  source = "./modules/app_insights"
  app_insights_name    = var.app_insights_name
  location             = var.location
  resource_group_name  = module.resource_group.resource_group_name
  workspace_id         = module.log_analytics.workspace_id
}

module "logic_app" {
  source = "./modules/logic_app"
  resource_group_name      = module.resource_group.resource_group_name
  location                 = module.resource_group.resource_group_location
  app_service_plan_id      = module.app_service_plan.app_service_plan_id
  storage_account_name     = module.storage_account.storage_account_name
  storage_account_key      = module.storage_account.account_key
  app_insights_key         = module.app_insights.instrumentation_key
  app_insights_conn_string = module.app_insights.connection_string
  logic_app_name           = var.logic_app_name
  functions_worker_runtime = var.functions_worker_runtime
  website_node_version     = var.website_node_version
  subnet_id                = module.vnet.subnet_id
}

module "metadata" {
  source = "./modules/metadata"

  storage_account_id            = module.storage_account.storage_account_id
  app_service_plan_id           = module.app_service_plan.app_service_plan_id
  vnet_id                       = module.vnet.vnet_id
  log_analytics_id              = module.log_analytics.workspace_id
  app_insights_id               = module.app_insights.app_insights_id
  logic_app_id                  = module.logic_app.logic_app_id
  storage_account_output_file   = "storage_account_metadata.json"
  app_service_plan_output_file  = "app_service_plan_metadata.json"
  vnet_output_file              = "vnet_metadata.json"
  log_analytics_output_file     = "log_analytics_metadata.json"
  app_insights_output_file      = "app_insights_metadata.json"
  logic_app_output_file         = "logic_app_metadata.json"
}