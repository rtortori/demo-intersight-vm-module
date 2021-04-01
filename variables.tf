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
  description = "The name of the target cluster, defaults to MYCLUSTER"
  default     = "MYCLUSTER"
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
  description = "Name of the target Datacenter. Defaults to MYDC"
  default     = "MYDC"
}
variable "folder" {
  description = "Path of the target folder. Defaults to /MYDC/vm/some_folder"
  default     = "/MYDC/vm/some_folder"
}
variable "template" {
  description = "Full path of the VM template. Defaults to /MYDC/vm/some_folder/ubuntu-image"
  default     = "/MYDC/vm/some_folder/ubuntu-image"
}
variable "datastore" {
  description = "Name of the Datastore. Defaults to MYDATASTORE"
  default     = "MYDATASTORE"
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
