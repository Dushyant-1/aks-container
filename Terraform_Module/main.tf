provider "azurerm" {
  features {}
  subscription_id = "1ecb68ad-b9f1-4f6e-8e63-c0e1d3d46c33"
}

resource "azurerm_resource_group" "main" {
  name     = "rg-akscluster"
  location = "East US 2"
}

resource "azurerm_container_registry" "acr" {
  name                = "dushyant01"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aksaryan0123456"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "dotnetaks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}
