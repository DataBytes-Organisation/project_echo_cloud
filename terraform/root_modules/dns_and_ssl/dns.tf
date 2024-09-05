# references resources in certificates.tf
resource "google_dns_record_set" "dns_authorization_wildcard_certificate" {
  name         = google_certificate_manager_dns_authorization.dns_authorization.dns_resource_record[0].name
  managed_zone = var.managed_zone_name
  type         = google_certificate_manager_dns_authorization.dns_authorization.dns_resource_record[0].type
  ttl          = 300
  rrdatas      = [google_certificate_manager_dns_authorization.dns_authorization.dns_resource_record[0].data]
}

# ip address for external_services load balancer which is created in kubernetes/manifests/ingress/fanout-ingress.yaml
resource "google_compute_global_address" "external_services" {
  name = "external-services"
}

resource "google_dns_record_set" "services" {
  name = "services.${var.public_domain_name}."
  type = "A"
  ttl  = 21600

  managed_zone = var.managed_zone_name

  rrdatas = [google_compute_global_address.external_services.address]
}
