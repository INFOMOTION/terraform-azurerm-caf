locals {
  prefixes = lookup(var.azuread_groups, "useprefix", false) ? try(var.global_settings.prefix-aad-groups, var.global_settings.prefixes) : []
  
  display_name = format("%s%s",try(format("%s-", local.prefixes.0), ""), var.azuread_groups.name)
}

resource "azuread_group" "group" {
  display_name            = local.display_name
  description             = lookup(var.azuread_groups, "description", null)
  prevent_duplicate_names = lookup(var.azuread_groups, "prevent_duplicate_names", null)
  owners = coalescelist(
    try(tolist(var.azuread_groups.owners), []),
    [
      var.client_config.object_id
    ]
  )
}
