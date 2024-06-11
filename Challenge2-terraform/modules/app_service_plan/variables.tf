# modules/app_service_plan/variables.tf

variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "location" {
  description = "The location/region where the App Service Plan will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the App Service Plan will be created."
  type        = string
}

variable "sku_tier" {
  description = "The SKU tier for the App Service Plan."
  type        = string
}

variable "sku_size" {
  description = "The SKU size for the App Service Plan."
  type        = string
}
