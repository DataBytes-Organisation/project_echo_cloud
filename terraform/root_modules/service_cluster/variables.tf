variable "region" {
  description = "The region where the GKE cluster will be deployed."
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "The name of the GKE cluster."
  type        = string
}

variable "credentials_file_path" {
  description = "Path to the Google Cloud service account credentials JSON file."
  type        = string
}

variable "service_account_id" {
  description = "The ID of the service account to be created."
  type        = string
  default     = "service-account-id"
}

variable "service_account_display_name" {
  description = "The display name of the service account."
  type        = string
  default     = "Service Account"
}

variable "initial_node_count" {
  description = "The initial number of nodes in the default node pool."
  type        = number
  default     = 3
}

variable "preemptible_node_count" {
  description = "The number of preemptible nodes in the managed node pool."
  type        = number
  default     = 1
}

variable "machine_type" {
  description = "The machine type for the GKE nodes."
  type        = string
  default     = "e2-medium"
}
