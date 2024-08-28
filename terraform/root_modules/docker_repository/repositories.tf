#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository
# create one repository
resource "google_artifact_registry_repository" "echo_repo" {
  location      = var.gcp_default_region
  repository_id = "project-echo"
  description   = "Project Echo Docker Repository"
  format        = "DOCKER"
}
