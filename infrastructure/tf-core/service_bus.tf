module "azure_sql_server" {
  for_each = var.regions

  source = "./modules/service-bus"

  servicebus_topic_name     = "servicebus_topic"
  servicebus_namespace_name = "servicebus_namespace"
  resource_group_name       = azurerm_resource_group.core[each.key].name
  location                  = each.key
  capacity                  = 1
  sku_tier                  = "Premium"

  tags = var.tags
}
