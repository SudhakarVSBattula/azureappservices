resource "azurerm_resource_group" "terraformappservice_rg" {
  name     = "terraformappservice-rg"
  location = var.location
}

resource "azurerm_service_plan" "terraformappservice_plan" {
  name                = "terraformappservice-plan"
  location            = azurerm_resource_group.terraformappservice_rg.location
  resource_group_name = azurerm_resource_group.terraformappservice_rg.name
  os_type             = "Windows"
  sku_name            = "S1"
}

resource "azurerm_windows_web_app" "terraformappservice" {
  name                = "appservice9096"
  location            = azurerm_resource_group.terraformappservice_rg.location
  resource_group_name = azurerm_resource_group.terraformappservice_rg.name
  service_plan_id     = azurerm_service_plan.terraformappservice_plan.id
  site_config {}
}
