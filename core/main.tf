data "azurerm_client_config" "current" {}

locals {
  base_name_template       = "${var.env_code}-${var.project}-core"
  base_name_template_short = "${var.env_code}${var.project}core"
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = lower("${local.base_name_template}-rg")
  location = var.default_location
  tags     = var.resource_group_tags
}

# Storage Account
resource "azurerm_storage_account" "sa" {
  resource_group_name             = azurerm_resource_group.rg.name
  name                            = lower("sa${local.base_name_template_short}")
  location                        = var.default_location
  tags                            = var.service_tags
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  shared_access_key_enabled       = true  # Simplifies pipeline and initial deploys. Set "false" disable shared access key.
  default_to_oauth_authentication = false  # Optional, but default
  min_tls_version                 = "TLS1_2"
}

# Container: core-state
resource "azurerm_storage_container" "tfstate" {
  name                 = "tfstate"
  storage_account_name = azurerm_storage_account.sa.name
  container_access_type = "private"
}