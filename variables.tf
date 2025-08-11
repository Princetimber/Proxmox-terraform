variable "pm_api_url" {
  type        = string
  description = "The URL of the Proxmox API."
}

variable "pm_api_token_id" {
  type        = string
  sensitive   = true
  description = "The ID of the Proxmox API token."
}

variable "pm_api_token_secret" {
  type        = string
  sensitive   = true
  description = "The secret of the Proxmox API token."
}

variable "local_vm_configs" {
  type = list(object({
    name        = string
    tags        = string
    target_node = string
    vmid        = number
    memory      = number
    cores       = number
    sockets     = number
    agent       = number
    bios        = string
    os_type     = string
    scsihw      = string
    qemu_os     = string
    cpu         = string
    vcpus       = number
    iso         = string
    virtio_iso  = string
    onboot      = number
    oncreate    = number
    numa        = bool
    hotplug     = string
    machine     = string
    bootdisk    = string
    network = object({
      model  = string
      bridge = string
      tag    = number
    })
    disk = object({
      type    = string
      size    = string
      storage = string
      discard = string
      ssd     = number
    })
  }))
  description = "A list of VM configurations."
}