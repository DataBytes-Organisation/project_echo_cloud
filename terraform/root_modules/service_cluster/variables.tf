
variable "gcp_project" {
  type        = string
  description = "GCP project the root module is deploying to."
}

variable "gcp_default_region" {
  type        = string
  description = "Default GCP region for root modules."
}

variable "gcp_default_zone" {
  type        = string
  description = "Default GCP zone for root modules."
}

variable "service_cluster_name" {
  description = "The name of the GKE cluster."
  type        = string
}

variable "service_cluster_primary_initial_node_count" {
  description = "The initial number of nodes in the default node pool."
  type        = number
}

# variable "preemptible_node_count" {
#   description = "The number of preemptible nodes in the managed node pool."
#   type        = number
#   default     = 1
# }

variable "service_cluster_primary_node_type" {
  description = "The machine type for the GKE nodes."
  type        = string
}
