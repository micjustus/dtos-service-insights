module "azure_service_bus" {
  for_each = var.regions

  source = "./modules/service-bus"

  servicebus_topic_name     = "servicebus-topic-alastair-michael-123"
  servicebus_namespace_name = "servicebus-namespace-alastair-michael-123"
  resource_group_name       = azurerm_resource_group.core[each.key].name
  location                  = each.key
  capacity                  = 1
  sku_tier                  = "Premium"

  tags = var.tags
}
