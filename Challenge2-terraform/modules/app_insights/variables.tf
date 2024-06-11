# modules/app_insights/variables.tf

variable "app_insights_name" {
  description = "The name of the Application Insights."
  type        = string
}

variable "location" {
  description = "The location/region where the Application Insights will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Application Insights will be created."
  type        = string
}

variable "application_type" {
  description = "The type of application for Application Insights."
  type        = string
  default     = "web"
}

variable "workspace_id" {
  description = "The ID of the log analytics workspace"
  type        = string
}