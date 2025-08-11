resource "proxmox_virtual_environment_vm" "vm_template" {
  for_each    = { for vm_config in var.local_vm_configs : vm_config.name => vm_config }
  name        = each.value.name
  description = "Managed by Terraform"
  tags        = split(",", each.value.tags)
  node_name   = each.value.target_node
  vm_id       = each.value.vmid
  on_boot     = each.value.onboot

  cpu {
    cores   = each.value.cores
    sockets = each.value.sockets
    type    = each.value.cpu
  }

  memory {
    dedicated = each.value.memory
  }

  agent {
    enabled = each.value.agent == 1
  }

  bios = each.value.bios

  operating_system {
    type = each.value.os_type
  }

  network_device {
    model   = each.value.network.model
    bridge  = each.value.network.bridge
    vlan_id = try(each.value.network.tag, -1)
  }

  disk {
    datastore_id = each.value.disk.storage
    file_format  = "raw" # Assuming raw, as type was 'scsi'
    interface    = "scsi0"
    size         = each.value.disk.size
    ssd          = each.value.disk.ssd == 1
  }

  disk {
    datastore_id = each.value.disk.storage
    file_format  = "raw"
    interface    = "efidisk0"
    size         = 4
  }

  cdrom {
    file_id = each.value.iso
  }

  disk {
    datastore_id      = "local" # ISOs are usually on 'local' storage
    file_format       = "raw"
    interface         = "ide3"
    path_in_datastore = each.value.virtio_iso
    size              = 1 # Size is required but ignored for ISOs
  }
}
