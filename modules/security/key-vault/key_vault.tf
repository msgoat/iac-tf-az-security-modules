locals {
  key_vault_name = "kv-${var.solution_fqn}"
}

resource azurerm_key_vault vault {
  name = local.key_vault_name
  location = var.resource_group_location
  resource_group_name = var.resource_group_name
  tenant_id = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment = true
  enabled_for_disk_encryption = true
  enabled_for_template_deployment = true
  purge_protection_enabled = true
  sku_name = "standard"

  lifecycle {
    ignore_changes = [ access_policy ]
  }

  tags = merge({
    "Name" = local.key_vault_name
  }, local.module_common_tags)
}
