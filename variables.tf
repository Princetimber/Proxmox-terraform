variable "local_vm_configs" {
  default = [

    {
      name        = "svr-win-2025"
      tags        = "prod, windows"
      target_node = "lab"
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
      iso         = "local:iso/winserver2025.iso"
      onboot      = false
      oncreate    = false
      numa        = true
      hotplug     = "network,disk,memory,cpu"
      machine     = "q35"
      bootdisk    = "scsi0"
      network = {
        model  = "virtio"
        bridge = "isovnet"
        tag    = 7
      }
      disk = {
        type    = "scsi"
        size    = "100G"
        storage = "local-zfs"
        discard = "on"
        ssd     = 1
      }
    },
    {
      name        = "svr-win-2025-core"
      tags        = "prod, windows"
      target_node = "lab"
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
      iso         = "local:iso/winserver2025.iso"
      onboot      = false
      oncreate    = false
      numa        = true
      hotplug     = "network,disk,memory,cpu"
      machine     = "q35"
      bootdisk    = "scsi0"
      network = {
        model  = "virtio"
        bridge = "isovnet"
      }
      disk = {
        type    = "scsi"
        size    = "60G"
        storage = "local-zfs"
        discard = "on"
        ssd     = 1
      }
    }
  ]
}

