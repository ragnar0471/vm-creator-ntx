# modules/subnet/main.tf
resource "nutanix_subnet" "this" {
  name      = var.name
  vlan_id   = var.vlan_id
  ip_prefix = var.ip_prefix
}


