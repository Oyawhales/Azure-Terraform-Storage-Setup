resource "azurerm_resource_group" "oyawhaless" {
  name     = "oyawales"
  location = "uksouth"
}

resource "azurerm_storage_account" "oyawhales" {
  name                     = "oyas"
  resource_group_name      = azurerm_resource_group.oyawhaless.name
  location                 = azurerm_resource_group.oyawhaless.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}


# Create an Azure Data Lake Storage Gen2 Account
resource "azurerm_storage_account" "oyawhales_gen2" {
  name                     = "oyasgen2"  # Storage account names must be globally unique
  resource_group_name      = azurerm_resource_group.oyawhaless.name
  location                 = azurerm_resource_group.oyawhaless.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

 is_hns_enabled = true  # This enables Data Lake Storage Gen2

}

# Create a File System (Container) in the Storage Account
resource "azurerm_storage_data_lake_gen2_filesystem" "example" {
  name               = "example-filesystem"
  storage_account_id = azurerm_storage_account.oyawhales.id

}
