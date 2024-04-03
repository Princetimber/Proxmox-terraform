resource "proxmox_vm_qemu" "vm_template" {
  for_each    = { for vm, vm_config in var.local_vm_configs : vm => vm_config }
  name        = each.value.name
  target_node = each.value.target_node
  vmid        = each.value.vmid
  memory      = each.value.memory
  cores       = each.value.cores
  sockets     = each.value.sockets
  agent       = each.value.agent
  bios        = each.value.bios
  os_type     = each.value.os_type
  scsihw      = each.value.scsihw
  qemu_os     = each.value.qemu_os
  cpu         = each.value.cpu
  vcpus       = each.value.vcpus
  iso         = each.value.iso
  onboot      = each.value.onboot
  oncreate    = each.value.oncreate
  numa        = each.value.numa
  hotplug     = each.value.hotplug
  machine     = each.value.machine
  bootdisk    = each.value.bootdisk
  network {
    model  = each.value.network.model
    bridge = each.value.network.bridge

  }
  disk {
    type    = each.value.disk.type
    size    = each.value.disk.size
    storage = each.value.disk.storage
    discard = each.value.disk.discard
    ssd     = each.value.disk.ssd
  }
}
