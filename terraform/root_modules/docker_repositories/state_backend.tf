# this file defines the state backend to be used
# the state file for the root module will be stored here
# https://developer.hashicorp.com/terraform/language/settings/backends/gcs

terraform {
  backend "gcs" {
    bucket = "databytes-project-echo-terraform-state"
    prefix = "terraform/state/docker_repositories"
  }
}
