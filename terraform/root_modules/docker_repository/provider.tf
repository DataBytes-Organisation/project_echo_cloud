# this file contains provider definitions
# the google provider allows the code to deploy resources to GCP
# https://developer.hashicorp.com/terraform/language/providers

provider "google" {
  project = var.gcp_project
  region  = var.gcp_default_region
  zone    = var.gcp_default_zone
}
