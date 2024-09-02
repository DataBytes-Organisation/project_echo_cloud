output "cluster_name" {
  description = "The name of the GKE cluster."
  value       = google_container_cluster.primary.name
}

output "endpoint" {
  description = "The GKE cluster endpoint."
  value       = google_container_cluster.primary.endpoint
}
