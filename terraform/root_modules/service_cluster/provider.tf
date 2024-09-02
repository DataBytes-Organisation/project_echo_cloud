# this file contains provider definitions
# the google provider allows the code to deploy resources to GCP
# https://developer.hashicorp.com/terraform/language/providers

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }

  backend "gcs" {
    bucket = "databytes-project-echo-terraform-state"
    prefix = "terraform/state/service_cluster"
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_default_region
  zone    = var.gcp_default_zone
}
