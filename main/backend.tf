terraform {
  backend "azurerm" {
    tenant_id = var.tenant_id
    subscription_id = var.subscription_id
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.key
    resource_group_name  = var.resource_group_name
  }
}
