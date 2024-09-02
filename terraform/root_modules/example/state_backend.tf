# this file defines the state backend to be used
# the state file for the root module will be stored here
# https://developer.hashicorp.com/terraform/language/settings/backends/gcs

# add the root_module name at the end of the prefix so its state is stored in its own path
# failing to set it differently for each root module causes errors

terraform {
  backend "gcs" {
    bucket = "databytes-project-echo-terraform-state"
    prefix = "terraform/state/example"
  }
}
