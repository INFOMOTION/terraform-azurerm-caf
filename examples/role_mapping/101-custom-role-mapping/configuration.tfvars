custom_role_definitions = {
  sql_network_contributor = {
    name        = "SQL Server Network Contributor"
    useprefix   = false
    description = "Used to allow Developers to add their IP to the SQL Server Firewall"

    assignable_scopes = {
      subscriptions = [
        {
          # Providing an object_id as string
          id = "/subscriptions/<SUBSCRIPTION_ID>"
        }
      ]
      resource_groups = [
        {
          key = "rg_default"
        }
      ]
    }

    permissions = {
      actions = [
        "Microsoft.Sql/servers/firewallRules/*"
      ]
    }
  }
}



role_mapping = {

   custom_role_mapping = {
    resource_groups = {
      rg_default = {
        # Custom Group referenced by Config
        "sql_network_contributor" = {
          azuread_groups = {
            #lz_key = "identity"
            keys   = ["developer"]
          }
        }
        # Custom Group referenced by Custom-Role-ID 
        "/subscriptions/<SUBSCRIPTION_ID>/providers/Microsoft.Authorization/roleDefinitions/<CUSTOM_ROLE_ID>" = {
          azuread_groups = {
            #lz_key = "identity"
            keys   = ["developer"]
          }
        }
      }
    }
  }
}