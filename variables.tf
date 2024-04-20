variable "local_vm_configs" {
  default = [

    {
      name        = "prod-winserver-2022-gui"
      tags        = "prod, windows"
      target_node = "pve"
      vmid        = 8001
      memory      = 8192
      cores       = 2
      sockets     = 2
      agent       = 1
      bios        = "ovmf"
      os_type     = "Microsoft Windows 11"
      scsihw      = "virtio-scsi-pci"
      qemu_os     = "win11"
      cpu         = "x86-64-v2-AES"
      vcpus       = 4
      iso         = "local:iso/winserver2022.iso"
      onboot      = false
      oncreate    = false
      numa        = true
      hotplug     = "network,disk,memory,cpu"
      machine     = "q35"
      bootdisk    = "scsi0"
      network = {
        model  = "virtio"
        bridge = "vmbr1"
        tag    = 7
      }
      disk = {
        type    = "scsi"
        size    = "100G"
        storage = "local-lvm"
        discard = "on"
        ssd     = 1
      }
    },
    {
      name        = "prod-winserver-2022-core"
      tags        = "prod, windows"
      target_node = "pve"
      vmid        = 8002
      memory      = 8192
      cores       = 2
      sockets     = 2
      agent       = 1
      bios        = "ovmf"
      os_type     = "Microsoft Windows 11"
      scsihw      = "virtio-scsi-pci"
      qemu_os     = "win11"
      cpu         = "x86-64-v2-AES"
      vcpus       = 4
      iso         = "local:iso/winserver2022.iso"
      onboot      = false
      oncreate    = false
      numa        = true
      hotplug     = "network,disk,memory,cpu"
      machine     = "q35"
      bootdisk    = "scsi0"
      network = {
        model  = "virtio"
        bridge = "vmbr1"
      }
      disk = {
        type    = "scsi"
        size    = "60G"
        storage = "local-lvm"
        discard = "on"
        ssd     = 1
      }
    }
  ]
}

