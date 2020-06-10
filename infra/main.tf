resource "azurerm_resource_group" "demo01" {
    name              = "brewdis-dev"
    location          = "westeurope"
}
 
resource "azurerm_redis_cache" "demo01" {
  count               = 1
  name                = "brews-dev"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.demo01.name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
}

resource "azurerm_spring_cloud_service" "demo01" {
  name                = "brewdis-spring-cloud"
  resource_group_name = azurerm_resource_group.demo01.name
  location            = "westeurope"

  config_server_git_setting {
    uri               = "https://github.com/selvasingh/spring-petclinic-microservices-config"
    label             = "master"
    search_paths      = ["."]
  }
}

resource "azurerm_spring_cloud_app" "brew" {
  name                = "storefront-dev"
  resource_group_name = azurerm_resource_group.demo01.name
  service_name        = azurerm_spring_cloud_service.demo01.name
}
