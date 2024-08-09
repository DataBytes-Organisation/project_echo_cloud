# this file defines a VPC network resource

resource "google_compute_network" "vpc_network" {
  name                    = local.vpc_network_name # this references vpc_network_name local within locals.tf
  auto_create_subnetworks = "true"
}
