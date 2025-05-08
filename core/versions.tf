terraform {
  required_version = "~> 1.11.3" #Specify a different version of Terraform, if needed.
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.53.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.117.0"
    }
  }
}
