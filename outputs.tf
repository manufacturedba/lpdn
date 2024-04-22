output "container_ipv4_address" {
  value = length(azurerm_container_group.container) > 0 ? azurerm_container_group.container[0].ip_address : null
}