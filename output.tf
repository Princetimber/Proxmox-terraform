output "vm_details" {
  description = "Details of the created virtual machines"
  value = { for vm in proxmox_vm_qemu.vm_template : vm.name => {
    id   = vm.id
    name = vm.name
    tags = vm.tags
  } }
}

output "vm_network" {
  description = "Network configuration of the created virtual machines"
  value = { for vm in proxmox_vm_qemu.vm_template : vm.name => {
    model  = vm.network.model
    bridge = vm.network.bridge
    mac    = vm.network.macaddr
  } }
}
