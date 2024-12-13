# main.tf

# Laden der Subnetz-Konfigurationsdateien
locals {
  subnet_configs = [for file in files("${path.module}/subnets/*.tfvars") : tomap(file("${file}"))]
}

# Subnetze erstellen
module "subnets" {
  for_each = { for idx, config in local.subnet_configs : idx => config }

  source    = "./modules/subnet"
  name      = each.value.name
  vlan_id   = each.value.vlan_id
  ip_prefix = each.value.ip_prefix
}

# Laden der VM-Konfigurationsdateien
locals {
  vm_configs = [for file in files("${path.module}/vms/*.tfvars") : tomap(file("${file}"))]
}

# VMs erstellen
module "vms" {
  for_each = { for idx, config in local.vm_configs : idx => config }

  source               = "./modules/vm"
  name                 = each.value.name
  num_vcpus            = each.value.num_vcpus
  num_cores_per_vcpu   = each.value.num_cores_per_vcpu
  memory_size_mib      = each.value.memory_size_mib
  image_name           = each.value.image_name
  additional_disks     = each.value.additional_disks
  network_interfaces   = each.value.network_interfaces
}
