resource "azurerm_resource_group" "terraform_appservice_rg" {
  name     = "terraform-appservice-rg"
  location = var.location
}

resource "azurerm_service_plan" "terraform_appservice_plan" {
  name                = "terraform-appservice-plan"
  location            = azurerm_resource_group.terraform_appservice_rg.location
  resource_group_name = azurerm_resource_group.terraform_appservice_rg.name
  os_type             = "Windows"
  sku_name            = "S1"
}

resource "azurerm_windows_web_app" "terraform_appservice" {
  name                = "app-service-9096"
  location            = azurerm_resource_group.terraform_appservice_rg.location
  resource_group_name = azurerm_resource_group.terraform_appservice_rg.name
  service_plan_id     = azurerm_service_plan.terraform_appservice_plan.id
  site_config {}
}
