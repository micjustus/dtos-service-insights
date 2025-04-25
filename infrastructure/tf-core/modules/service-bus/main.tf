resource "azurerm_servicebus_namespace" "this" {
  name                          = var.servicebus_namespace_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku                           = var.sku_tier
  capacity                      = var.capacity
  premium_messaging_partitions  = var.premium_messaging_partitions
  public_network_access_enabled = var.public_network_access_enabled

  tags = var.tags
}

resource "azurerm_servicebus_topic" "this" {
  for_each = var.servicebus_topic_list

  name         = each.value.name
  status       = each.value.status
  namespace_id = azurerm_servicebus_namespace.this.id

  partitioning_enabled = each.value.partitioning_enabled
}