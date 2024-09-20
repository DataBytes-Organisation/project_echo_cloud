provider "google" {
  project = "sit-23t1-project-echo-25288b9"
  region  = "australia-southeast2"
}

resource "google_compute_instance" "default" {
  name         = "simple-instance"
  machine_type = "n1-standard-1"
  zone         = "australia-southeast2-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
