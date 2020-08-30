terraform {
  required_version = ">= 0.12"
  required_providers {
    esxi = {
      version = "~> 1.7"
    }
  }
}

provider "esxi" {
  esxi_hostname      = var.esxi_host
  esxi_hostport      = "22"
  esxi_hostssl       = "443"
  esxi_username      = var.esxi_username
  esxi_password      = var.esxi_password
}

resource "esxi_guest" "openstack" {
  guest_name     = "openstack"
  numvcpus       = "4"
  memsize        = "16384"  # in Mb
  boot_disk_size = "200" # in Gb
  boot_disk_type = "thin"
  disk_store     = var.datastore
  guestos        = "centos-64"
  power          = "off"
  virthwver      = "13"

  network_interfaces {
    virtual_network = var.home_network
  }
}
