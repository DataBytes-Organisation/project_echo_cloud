
resource "google_container_cluster" "primary" {
  name                     = var.service_cluster_name
  location                 = var.gcp_default_region
  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection      = false
}

resource "google_container_node_pool" "primary_managed_nodes" {
  name       = "service-cluster-managed-node-pool"
  location   = var.gcp_default_region
  cluster    = google_container_cluster.primary.name
  node_count = var.service_cluster_primary_initial_node_count

  node_config {
    machine_type = var.service_cluster_primary_node_type
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
