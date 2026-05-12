terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
  }
}

variable "vm_name" {
  description = "The name of the dummy VM for K3s"
  type        = string
  default     = "ubuntu-k3s-demo"
}

resource "local_file" "demo_inventory" {
  content  = "K3s Environment VM Name: ${var.vm_name}\n"
  filename = "${path.module}/dummy_inventory.txt"
}

output "k3s_vm_name" {
  value = var.vm_name
}
