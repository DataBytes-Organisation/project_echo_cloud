# this file defines a virtual machine resource within vpc_network

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-example-instance-${var.env}" # notice the syntax on string interpolation - ${}
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.id
    access_config {
    }
  }
}
