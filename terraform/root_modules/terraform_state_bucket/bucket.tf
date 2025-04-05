resource "google_storage_bucket" "tooling_state" {
  name                        = "databytes-project-echo-terraform-state"
  location                    = var.gcp_default_region
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 90 # Auto-delete old state files after 90 days
    }
  }

  encryption {
    default_kms_key_name = google_kms_crypto_key.terraform_state_key.id
  }
}

# KMS key for state encryption
resource "google_kms_crypto_key" "terraform_state_key" {
  name     = "terraform-state-key"
  key_ring = google_kms_key_ring.terraform_key_ring.id
  purpose  = "ENCRYPT_DECRYPT"
  lifecycle {
    prevent_destroy = true # Makes KMS key undeletable
  }
}

resource "google_kms_key_ring" "terraform_key_ring" {
  name     = "terraform-state-keyring"
  location = var.gcp_default_region
}
