variable "gcp_project" {
  type        = string
  description = "GCP project the root module is deploying to."
}

variable "gcp_default_region" {
  type        = string
  description = "Default GCP region for root modules."
}

variable "gcp_default_zone" {
  type        = string
  description = "Default GCP zone for root modules."
}

variable "env" {
  type        = string
  description = "Infrastructure environment. Should be one of dev, sit or prod."
}

variable "project_top_level_domain_name" {
  type        = string
  description = "Top level domain name for the project. databytesprojectecho.com"
}
