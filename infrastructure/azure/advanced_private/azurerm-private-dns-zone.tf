resource "azurerm_private_dns_zone" "acr" {
  name                = "privatelink.azurecr.io"
  resource_group_name = azurerm_resource_group.aks.name
}


resource "azurerm_private_dns_zone_virtual_network_link" "acr" {
  name                  = "acrprivdnslink"
  resource_group_name   = azurerm_resource_group.aks.name
  private_dns_zone_name = azurerm_private_dns_zone.acr.name
  virtual_network_id    = azurerm_virtual_network.aks.id
}

resource "azurerm_private_endpoint" "acr" {
  name                = "acr-endpoint"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  subnet_id           = azurerm_subnet.acr.id

  private_dns_zone_group {
    name = "acr"
    private_dns_zone_ids = [azurerm_private_dns_zone.acr.id]
  }

  private_service_connection {
    name                           = "acr-privateserviceconnection"
    private_connection_resource_id = azurerm_container_registry.acr.id
    is_manual_connection           = false
    subresource_names              = ["registry"]
  }
}


resource "azurerm_private_dns_a_record" "acr-endpoint" {
  name                = azurerm_container_registry.acr.name
  zone_name           = azurerm_private_dns_zone.acr.name
  resource_group_name = azurerm_resource_group.aks.name
  ttl                 = 300
  records             = [azurerm_private_endpoint.acr.private_service_connection[0].private_ip_address]
}


resource "azurerm_private_dns_a_record" "acr-data" {
  name                = "${azurerm_container_registry.acr.name}.${azurerm_resource_group.aks.location}.data"
  zone_name           = azurerm_private_dns_zone.acr.name
  resource_group_name = azurerm_resource_group.aks.name
  ttl                 = 300
  records             = [azurerm_private_endpoint.acr.private_service_connection[0].private_ip_address]
}