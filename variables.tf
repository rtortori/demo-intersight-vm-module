variable "name" {
  description = "The name of the Virtual Machine"
}
variable "port_group" {
  description = "The name of the VMware Port Group"
}
variable "vm_size" {
  description = "The size of the VM. Accepted values: small, medium, large"
}
variable "cluster_name" {
  description = "The name of the target cluster, defaults to RMLAB - Workloads"
  default     = "RMLAB - Workloads"
}
variable "guest_os" {
  description = "Guest OS. Defaults to linux"
  default     = "linux"
}
variable "adaptor_type" {
  description = "Type of VM NIC. Defaults to VMXNET3"
  default     = "VMXNET3"
}
variable "datacenter" {
  description = "Name of the target Datacenter. Defaults to RMLAB"
  default     = "RMLAB"
}
variable "folder" {
  description = "Path of the target folder. Defaults to /RMLAB/vm/rtortori"
  default     = "/RMLAB/vm/rtortori"
}
variable "template" {
  description = "Full path of the VM template. Defaults to /RMLAB/vm/rtortori/ubuntu-image"
  default     = "/RMLAB/vm/rtortori/ubuntu-image"
}
variable "datastore" {
  description = "Name of the Datastore. Defaults to JOHNNY01_DATACENTER01"
  default     = "JOHNNY01_DATASTORE01"
}

locals {
  cpu = {
    "small"  = 1
    "medium" = 2
    "large"  = 4
  }

  memory = {
    "small"  = 1024
    "medium" = 2048
    "large"  = 4096
  }
}
