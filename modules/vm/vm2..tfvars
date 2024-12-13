# vms/vm1.tfvars
name                 = "vm-2"
num_vcpus            = 2
num_cores_per_vcpu   = 2
memory_size_mib      = 4096
image_name           = "redhat-image"
cluster_name = "cf1-testntx.de.clara.net"

additional_disks = [
  { size_mib = 10240 },
  { size_mib = 20480 }
]

network_interfaces = [
  { subnet_name = "subnet-1" },
  { subnet_name = "subnet-2" }
]
