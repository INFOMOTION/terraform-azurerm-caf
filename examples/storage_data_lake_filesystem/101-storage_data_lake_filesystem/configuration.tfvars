global_settings = {
  default_region = "region1"
  regions = {
    region1 = "australiaeast"
  }
}

resource_groups = {
  test = {
    name = "rg1"
  }
}

# https://docs.microsoft.com/en-us/azure/storage/
storage_accounts = {
  sa1 = {
    name                     = "storage1"
    resource_group_key       = "rg1"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    access_tier              = "Hot"
    is_hns_enabled           = true
  }
}


storage_data_lake_filesystems = {
  fs1 = {
    name = "myfilesystem"
    storage_account_key = "sa1"
    properties = {
    }
  }
}