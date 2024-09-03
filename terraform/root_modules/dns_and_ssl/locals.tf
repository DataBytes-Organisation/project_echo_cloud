locals {
  public_subdomain_name = "${var.env}-public"
  public_hosted_domain_name = "${public_subdomain_name}.${var.project_top_level_domain_name}"
}
