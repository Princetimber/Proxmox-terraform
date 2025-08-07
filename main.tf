resource "proxmox_vm_qemu" "vm_template" {
  for_each    = { for vm_config in var.local_vm_configs : vm_config.name => vm_config }
  name        = each.value.name
  tags        = each.value.tags
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
    tag    = try(each.value.network.tag, -1)
  }
  disk {
    type    = each.value.disk.type
    size    = each.value.disk.size
    storage = each.value.disk.storage
    discard = each.value.disk.discard
    ssd     = each.value.disk.ssd
  }

  dynamic "disk" {
    for_each = can(each.value.virtio_iso) ? [1] : []
    content {
      type    = "ide"
      media   = "cdrom"
      file    = each.value.virtio_iso
      storage = each.value.disk.storage
      size    = "1G" # Default size for a CD-ROM
    }
  }

  dynamic "disk" {
    for_each = each.value.bios == "ovmf" ? [1] : []
    content {
      type    = "efidisk"
      storage = each.value.disk.storage
      size    = "4M"
    }
  }
}
