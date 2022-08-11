locals {
  prefixes = lookup(var.azuread_groups, "useprefix", false) ? try(var.global_settings.prefix-aad-groups, var.global_settings.prefixes) : []
  
  display_name = format("%s%s",try(format("%s-", local.prefixes.0), ""), var.azuread_groups.name)
}

resource "azuread_group" "group" {
  display_name            = local.display_name
  description             = lookup(var.azuread_groups, "description", null)
  prevent_duplicate_names = lookup(var.azuread_groups, "prevent_duplicate_names", null)
  owners = local.owners
}

locals {
  owners = concat(
    try(tolist(var.azuread_groups.owners), []),
    try(tolist(var.azuread_groups.owners.object_ids), []),
    [
      var.client_config.object_id
    ],
    local.ad_user_oids
  )
  ad_user_oids = [for user in try(var.azuread_groups.owners.user_principal_names, []) :
    data.azuread_user.main[user].object_id
  ]
}

