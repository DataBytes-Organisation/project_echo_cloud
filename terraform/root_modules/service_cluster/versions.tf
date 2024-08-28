terraform {
  required_version = ">= 1.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file_path)
  project     = "sit-23t1-project-echo-25288b9"
  region      = var.region
}
