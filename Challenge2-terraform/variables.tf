# variables.tf

variable "subscription_id" {
  description = "The subscription ID for the Azure account."
  type        = string
}

variable "client_id" {
  description = "The client ID (app ID) for the Azure service principal."
  type        = string
}

variable "client_secret" {
  description = "The client secret (password) for the Azure service principal."
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "The tenant ID for the Azure service principal."
  type        = string
}

variable "location" {
  description = "The location/region where the Logic App will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location/region where the resource group will be created."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "account_tier" {
  description = "The tier of the storage account"
  type        = string
}

variable "account_replication_type" {
  description = "The replication type of the storage account"
  type        = string
}


variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "app_service_plan_sku_tier" {
  description = "The SKU tier for the App Service Plan."
  type        = string
}

variable "app_service_plan_sku_size" {
  description = "The SKU size for the App Service Plan."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)
}

variable "app_insights_name" {
  description = "The name of the Application Insights."
  type        = string
}

variable "workspace_name" {
  description = "The name of the log analytics workspace"
  type        = string
}

variable "functions_worker_runtime" {
  description = "The runtime for functions worker"
  type        = string
}

variable "website_node_version" {
  description = "The node version for the website"
  type        = string
}

variable "app_insights_key" {
  description = "The instrumentation key for application insights"
  type        = string
}

variable "app_insights_conn_string" {
  description = "The connection string for application insights"
  type        = string
}


variable "logic_app_name" {
  description = "The name of the Logic App."
  type        = string
}