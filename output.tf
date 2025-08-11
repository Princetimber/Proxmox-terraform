output "vm_details" {
  description = "Details of the created virtual machines"
  value = { for vm in proxmox_virtual_environment_vm.vm_template : vm.name => {
    id   = vm.id
    name = vm.name
    tags = vm.tags
  } }
}

output "vm_network" {
  description = "Network configuration of the created virtual machines"
  value = { for vm in proxmox_virtual_environment_vm.vm_template : vm.name => {
    for net in vm.network_device : net.model => {
      bridge = net.bridge
      mac    = net.mac_address
    }
  } }
}
