variable "storage_account_id" {
  description = "The ID of the storage account"
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the app service plan"
  type        = string
}

variable "vnet_id" {
  description = "The ID of the virtual network"
  type        = string
}

variable "log_analytics_id" {
  description = "The ID of the log analytics workspace"
  type        = string
}

variable "app_insights_id" {
  description = "The ID of the application insights"
  type        = string
}

variable "logic_app_id" {
  description = "The ID of the logic app"
  type        = string
}

variable "storage_account_output_file" {
  description = "Output file for storage account metadata"
  type        = string
}

variable "app_service_plan_output_file" {
  description = "Output file for app service plan metadata"
  type        = string
}

variable "vnet_output_file" {
  description = "Output file for virtual network metadata"
  type        = string
}

variable "log_analytics_output_file" {
  description = "Output file for log analytics workspace metadata"
  type        = string
}

variable "app_insights_output_file" {
  description = "Output file for application insights metadata"
  type        = string
}

variable "logic_app_output_file" {
  description = "Output file for logic app metadata"
  type        = string
}
