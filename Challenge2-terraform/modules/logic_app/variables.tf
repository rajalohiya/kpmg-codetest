# modules/logic_app/variables.tf

variable "logic_app_name" {
  description = "The name of the Logic App."
  type        = string
}

variable "location" {
  description = "The location/region where the Logic App will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Logic App will be created."
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet for the private endpoint."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "storage_account_key" {
  description = "The access key for the storage account"
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