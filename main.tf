resource "azurerm_resource_group" "terraform_appservice_rg" {
  name     = "terraform-appservice-rg"
  location = var.location
}

resource "azurerm_service_plan" "terraform_app_service_plan" {
  name                = "terraform-app-service-plan"
  location            = azurerm_resource_group.terraform_appservice_rg.location
  resource_group_name = azurerm_resource_group.terraform_appservice_rg.name
  os_type             = "Windows"
  sku_name            = "S1"
}

resource "azurerm_windows_web_app" "terraform_app_service" {
  name                = "app-service-90961519"
  location            = azurerm_resource_group.terraform_appservice_rg.location
  resource_group_name = azurerm_resource_group.terraform_appservice_rg.name
  service_plan_id     = azurerm_service_plan.terraform_app_service_plan.id
  site_config {}
}
