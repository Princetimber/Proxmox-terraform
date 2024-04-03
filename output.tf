output "vm_template" {
  value = [for vm in proxmox_vm_qemu.vm_template : vm.name]
}
