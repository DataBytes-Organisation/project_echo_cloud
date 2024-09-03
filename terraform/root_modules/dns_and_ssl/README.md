resource "google_dns_managed_zone" "public_dns_zone" {
  name        = "public-dns-zone"
  dns_name    = "example.com."
  description = "Public DNS zone for example.com"

  lifecycle {
    prevent_destroy = true
  }
}
