#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository
# create one repository for each value in docker_repositories
resource "google_artifact_registry_repository" "echo_repo" {
  for_each      = toset(var.docker_repositories)
  location      = var.gcp_default_region
  repository_id = each.key
  description   = "Project Echo Docker Repository for image ${each.key}"
  format        = "DOCKER"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository_iam
# Editors get admin access (students that are cloud engineers)
resource "google_artifact_registry_repository_iam_member" "admin_repo_iam" {
  for_each   = google_artifact_registry_repository.echo_repo
  location   = each.value.location
  repository = each.value.name
  role       = "roles/artifactregistry.repoAdmin"
  member     = "projectEditor:${var.gcp_project}"
}

# Viewers have access to pull (most other students can have this access) 
resource "google_artifact_registry_repository_iam_member" "read_repo_iam" {
  for_each   = google_artifact_registry_repository.echo_repo
  location   = each.value.location
  repository = each.value.name
  role       = "roles/artifactregistry.reader"
  member     = "projectViewer:${var.gcp_project}"
}
