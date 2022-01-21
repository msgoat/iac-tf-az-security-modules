terraform {
  required_providers {
    azurerm = {
      version = "~> 2.85"
    }
  }
}

locals {
  module_common_tags = var.common_tags
}

data azurerm_client_config current {

}
