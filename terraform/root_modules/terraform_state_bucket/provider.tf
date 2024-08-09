# this file contains provider configuration(s)

provider "google" {
  project = var.gcp_project
  region  = var.gcp_default_region
  zone    = var.gcp_default_zone
}
