resource "azurerm_servicebus_namespace" "this" {
  name                = var.servicebus_namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku_tier
  capacity            = var.capacity

  tags = var.tags
}

resource "azurerm_servicebus_topic" "this" {
  name         = var.servicebus_topic_name
  namespace_id = azurerm_servicebus_namespace.this.id

  partitioning_enabled = false
}