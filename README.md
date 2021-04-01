# Demo Private Terraform Module 
### Create ESXi VMs

#### Sample Module Usage

```
# Create small Ubuntu VMs
module "ubuntu_virtual_machine_small" {
  source  = "app.terraform.io/your_TFC_org/module-name/intersight"
  version = "0.1.1"
  vm_size = "small"
  name = "ubuntu-small-tf"
  port_group = "192.168.100"
  count = 1
}
```

#### Inputs

| Input Name   | Description                                               | Required | Default                         |
|--------------|-----------------------------------------------------------|----------|---------------------------------|
| name         | The name of the Virtual Machine                           | Required |                                 |
| port_group   | The name of the VMware Port Group                         | Required |                                 |
| vm_size      | The size of the VM. Accepted values: small, medium, large | Required |                                 |
| cluster_name | The name of the target cluster                            | Optional | MYCLUSTER                       |
| guest_os     | Guest OS                                                  | Optional | linux                           |
| adaptor_type | Type of VM NIC                                            | Optional | VMXNET3                         |
| datacenter   | Name of the target Datacenter                             | Optional | MYDC                            |
| folder       | Path of the target folder                                 | Optional | /MYDC/vm/some_folder            |
| template     | Full path of the VM template                              | Optional | /MYDC/vm/some_folder/ubuntu-image |
| datastore    | Name of the Datastore                                     | Optional | MYDATASTORE                     |