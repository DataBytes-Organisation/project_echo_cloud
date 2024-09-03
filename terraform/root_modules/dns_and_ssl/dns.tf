resource "google_dns_managed_zone" "public_dns_zone" {
  name        = "public-dns-zone"
  dns_name    = local.public_hosted_domain_name
  description = "Public DNS zone for ${var.env} environment of ${var.project_top_level_domain_name}."

  lifecycle {
    prevent_destroy = false
  }
}

# references resources in certificates.tf
resource "google_dns_record_set" "dns_authorization_wildcard_certificate" {
  name         = google_certificate_manager_dns_authorization.dns_authorization.dns_resource_record[0].name
  managed_zone = google_dns_managed_zone.public_dns_zone.name
  type         = google_certificate_manager_dns_authorization.dns_authorization.dns_resource_record[0].type
  ttl          = 300
  rrdatas      = [google_certificate_manager_dns_authorization.dns_authorization.dns_resource_record[0].data]
}
