provider "aws" {
  region = "us-west-2"
}

provider "azurerm" {
  features {}
}

resource "aws_s3_bucket" "aws_bucket" {
  bucket = "aws-storage"
}

resource "azurerm_storage_account" "azure_storage" {
  name                     = "azurstoracc"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
