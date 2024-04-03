locals {
  vm_configs = [
    {
      name        = "prod-ubuntu-22.04.4"
      tags        = "prod,linux"
      target_node = "pve"
      vmid        = 8000
      memory      = 4096
      cores       = 2
      sockets     = 1
      agent       = 1
      bios        = "ovmf"
      os_type     = "ubuntu 22.04.3"
      scsihw      = "virtio-scsi-pci"
      qemu_os     = "l26"
      cpu         = "x86-64-v2-AES"
      vcpus       = 2
      iso         = "local:iso/ubuntu-22.04.3-live-server-amd64.iso"
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
        size    = "50G"
        storage = "local-lvm"
        discard = "on"
        ssd     = 1
      }
    },
    {
      name        = "prod-winserver-2022-core"
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
      name        = "prod-winserver-2022-gui"
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
        size    = "100G"
        storage = "local-lvm"
        discard = "on"
        ssd     = 1
      }
    },
    {
      name        = "prod-rocky-linux-9.3"
      tags        = "prod,linux"
      target_node = "pve"
      vmid        = 8003
      memory      = 4096
      cores       = 2
      sockets     = 1
      agent       = 1
      bios        = "ovmf"
      os_type     = "rocky 9.3"
      scsihw      = "virtio-scsi-pci"
      qemu_os     = "l26"
      cpu         = "x86-64-v2-AES"
      vcpus       = 2
      iso         = "local:iso/Rocky-9.3-x86_64-dvd.iso"
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
        size    = "50G"
        storage = "local-lvm"
        discard = "on"
        ssd     = 1
      }
    }
  ]
}
