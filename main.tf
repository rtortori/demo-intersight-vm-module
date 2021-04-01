# Fetch the target cluster specs as defined in the common vm specs variable (map)
data "intersight_virtualization_vmware_cluster" "vmware_cluster" {
  name = var.cluster_name
}

# Create Virtual Machine
resource "intersight_virtualization_virtual_machine" "linux_vm" {
  lifecycle {
    create_before_destroy = false
  }
  class_id        = "virtualization.VirtualMachine"
  object_type     = "virtualization.VirtualMachine"
  name            = var.name
  action          = "Create"
  cpu             = local.cpu[var.vm_size]
  memory          = local.memory[var.vm_size]
  hypervisor_type = "ESXi"
  guest_os        = var.guest_os
  power_state     = "PowerOn"

  cluster = [
    {
      object_type           = "virtualization.VmwareCluster"
      additional_properties = ""
      class_id              = "virtualization.VmwareCluster"
      selector              = ""
      moid                  = data.intersight_virtualization_vmware_cluster.vmware_cluster.id
    }
  ]

  interfaces = [{
    adaptor_type          = var.adaptor_type
    additional_properties = ""
    bridge                = var.port_group
    class_id              = "virtualization.EsxiVmNetworkConfiguration"
    connect_at_power_on   = true
    direct_path_io        = false
    mac_address           = ""
    object_type           = "virtualization.EsxiVmNetworkConfiguration"
  }]

  vm_config = [{
    additional_properties : jsonencode({
      Compute = {
        ResourcePool = ""
        Annotation   = ""
        ObjectType   = "virtualization.EsxiVmComputeConfiguration"
      }
      Customspec = null
      Datacenter = var.datacenter
      Folder     = var.folder
      Image      = ""
      Network = {
        Interfaces = []
        ObjectType = "virtualization.EsxiVmNetworkConfiguration"
      }
      Storage = {
        Datastore  = var.datastore
        Disks      = []
        ObjectType = "virtualization.EsxiVmStorageConfiguration"
      }
      Template = var.template
    })
    class_id    = "virtualization.EsxiVmConfiguration"
    object_type = "virtualization.EsxiVmConfiguration"
  }]


  provision_type = "Template"
  cluster_esxi   = data.intersight_virtualization_vmware_cluster.vmware_cluster.name
}
