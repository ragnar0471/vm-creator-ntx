# modules/vm/main.tf
resource "nutanix_virtual_machine" "this" {
  name       = var.name
  num_vcpus  = var.num_vcpus
  num_cores_per_vcpu = var.num_cores_per_vcpu
  memory_size_mib    = var.memory_size_mib

  # Erste Festplatte (Image)
  disk_list {
    data_source_reference {
      kind = "image"
      name = var.image_name
    }
  }

  # Zusätzliche Festplatten
  dynamic "disk_list" {
    for_each = var.additional_disks
    content {
      device_properties {
        disk_size_mib = disk_list.value.size_mib
      }
    }
  }

  # Netzwerk-Interfaces
  dynamic "nic_list" {
    for_each = var.network_interfaces
    content {
      subnet_reference {
        kind = "subnet"
        name = nic_list.value.subnet_name
      }
    }
  }
}