variable "capacity" {
  description = "When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity must be 0."
  type        = number
  default     = 1
  validation {
    condition = (
      (var.sku_tier == "Premium" && contains([1, 2, 4, 8, 16], var.capacity)) ||
      ((var.sku_tier == "Basic" || var.sku_tier == "Standard") && var.capacity == 0)
    )
    error_message = "Invalid capacity: Premium allows 1, 2, 4, 8 or 16. Basic and Standard must have capacity 0."
  }
}

variable "location" {
  description = "The location/region where the Service Bus namespace will be created."
  type        = string
  default     = "uksouth"
  validation {
    condition     = contains(["uksouth", "ukwest"], var.location)
    error_message = "The location must be either uksouth or ukwest."
  }
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Event Grid. Changing this forces a new resource to be created."
  validation {
    condition     = can(regex("^[-\\w\\._\\(\\)]+$", var.resource_group_name)) && length(var.resource_group_name) > 0
    error_message = "The resource group name must be a non-empty string using only alphanumeric characters, dashes, underscores, periods, or parentheses."
  }
}

variable "servicebus_namespace_name" {
  description = "The name of the Service Bus namespace."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9][a-zA-Z0-9-]{6,49}$", var.servicebus_namespace_name))
    error_message = "The Service Bus namespace name must be between 7 and 50 characters and can contain only letters, numbers, and hyphens. It must start with a letter or number."
  }
}

variable "servicebus_topic_name" {
  description = "The name of the Service Bus topic."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9\\-\\.]{1,260}$", var.servicebus_topic_name))
    error_message = "The topic name must be 1-260 characters long and may contain letters, numbers, hyphens, and periods."
  }
}

variable "sku_tier" {
  description = "The tier of the SKU."
  type        = string
  default     = "Standard"
  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku_tier)
    error_message = "The SKU name must be either Basic, Standard or Premium."
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}