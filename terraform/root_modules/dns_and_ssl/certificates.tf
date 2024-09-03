## Configure DNS authorization to provide the ACME challenge DNS records ##
resource "google_certificate_manager_dns_authorization" "dns_authorization" {
  name        = "dns-authorization"
  description = "DNS authorization for ${local.public_hosted_domain_name} to support wildcard certificates"
  domain      = local.public_hosted_domain_name
}

## Provision a wildcard managed SSL certificate using DNS authorization ##
resource "google_certificate_manager_certificate" "wildcard_ssl_certificate" {
  name        = "${local.public_subdomain_name}-wildcard-ssl-certificate"
  description = "Wildcard certificate for ${local.public_hosted_domain_name} and sub-domains"

  managed {
    domains = [local.public_hosted_domain_name, "*.${local.public_hosted_domain_name}"]
    dns_authorizations = [
      google_certificate_manager_dns_authorization.dns_authorization.id
    ]
  }
}

## Certificate map resource to reference to from a forwarding rule ##
resource "google_certificate_manager_certificate_map" "certificate_map" {
  name        = "${local.public_subdomain_name}-certificate-map"
  description = "${local.public_hosted_domain_name} certificate map containing the domain names and sub-domains names for the SSL certificate"
}

## Certificate map entry for dev-public.databytesprojectecho.com
resource "google_certificate_manager_certificate_map_entry" "domain_certificate_entry" {
  name         = "${local.public_subdomain_name}-domain-cert-entry"
  description  = "${local.public_hosted_domain_name} certificate entry"
  map          = google_certificate_manager_certificate_map.certificate_map.name
  certificates = [google_certificate_manager_certificate.wildcard_ssl_certificate.id]
  hostname     = local.public_hosted_domain_name
}

## Certificate map entry *.dev-public.databytesprojectecho.com
resource "google_certificate_manager_certificate_map_entry" "wildcard_domain_certificate_entry" {
  name         = "${local.public_subdomain_name}-wildcard-domain-entry"
  description  = "*.${local.public_hosted_domain_name} certificate entry"
  map          = google_certificate_manager_certificate_map.certificate_map.name
  certificates = [google_certificate_manager_certificate.wildcard_ssl_certificate.id]
  hostname     = "*.${local.public_hosted_domain_name}"
}
