# ## Configure DNS authorization to provide the ACME challenge DNS records
# resource "google_certificate_manager_dns_authorization" "dns_authorization" {
#   name        = "public-domain-dns-authorization"
#   description = "DNS authorization for ${var.public_domain_name} to support wildcard certificates"
#   domain      = var.public_domain_name
# }

# ## Provision a wildcard managed SSL certificate using DNS authorization ##
# resource "google_certificate_manager_certificate" "wildcard_ssl_certificate" {
#   name        = "public-wildcard-ssl-certificate"
#   description = "Wildcard certificate for ${var.public_domain_name} and sub-domains"

#   managed {
#     domains = [var.public_domain_name, "*.${var.public_domain_name}"]
#     dns_authorizations = [
#       google_certificate_manager_dns_authorization.dns_authorization.id
#     ]
#   }
# }

# ## Certificate map resource to reference to from a forwarding rule ##
# resource "google_certificate_manager_certificate_map" "certificate_map" {
#   name        = "public-domain-map"
#   description = "${var.public_domain_name} certificate map containing the domain names and sub-domains names for the SSL certificate"
# }

# ## Certificate map entry for databytesprojectecho.com
# resource "google_certificate_manager_certificate_map_entry" "domain_certificate_entry" {
#   name         = "public-domain-cert-entry"
#   description  = "${var.public_domain_name} certificate entry"
#   map          = google_certificate_manager_certificate_map.certificate_map.name
#   certificates = [google_certificate_manager_certificate.wildcard_ssl_certificate.id]
#   hostname     = var.public_domain_name
# }

# ## Certificate map entry *.databytesprojectecho.com
# resource "google_certificate_manager_certificate_map_entry" "wildcard_domain_certificate_entry" {
#   name         = "public-wildcard-domain-entry"
#   description  = "*.${var.public_domain_name} certificate entry"
#   map          = google_certificate_manager_certificate_map.certificate_map.name
#   certificates = [google_certificate_manager_certificate.wildcard_ssl_certificate.id]
#   hostname     = "*.${var.public_domain_name}"
# }
