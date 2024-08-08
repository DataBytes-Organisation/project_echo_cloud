resource "google_storage_bucket" "tooling_state" {
  name                        = "databytes-project-echo-terraform-state"
  location                    = var.gcp_default_region
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}
