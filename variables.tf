# Variables for Subnet
variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "vlan_id" {
  description = "The VLAN ID of the subnet."
  type        = number
}

variable "ip_prefix" {
  description = "The IP prefix for the subnet (CIDR format)."
  type        = string
}

# Variables for VM
variable "name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "num_vcpus" {
  description = "The number of virtual CPUs for the VM."
  type        = number
}

variable "num_cores_per_vcpu" {
  description = "The number of cores per virtual CPU."
  type        = number
}

variable "memory_size_mib" {
  description = "The memory size in MiB for the VM."
  type        = number
}

variable "image_name" {
  description = "The name of the image to use for the VM's boot disk."
  type        = string
}

variable "additional_disks" {
  description = "A list of additional disks to attach to the VM, each with a size in MiB."
  type = list(object({
    size_mib = number
  }))
  default = []
}

variable "network_interfaces" {
  description = "A list of network interfaces for the VM, each specifying the name of the subnet."
  type = list(object({
    subnet_name = string
  }))
  default = []
}