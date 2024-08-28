resource "google_service_account" "default" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
}

resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "preemptible-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.preemptible_node_count

  node_config {
    preemptible  = true
    machine_type = var.machine_type
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

resource "google_container_node_pool" "primary_managed_nodes" {
  name       = "managed-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.initial_node_count

  node_config {
    machine_type    = var.machine_type
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      foo = "bar"
    }
    tags = ["foo", "bar"]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}
