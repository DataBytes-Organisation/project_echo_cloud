# ip address for iot load balancer which is created in kubernetes/manifests/ingress/fanout-ingress.yaml
resource "google_compute_global_address" "iot" {
  name = "iot"
}

resource "google_dns_record_set" "services" {
  name = "iot.${var.public_domain_name}."
  type = "A"
  ttl  = 21600

  managed_zone = var.managed_zone_name

  rrdatas = [google_compute_global_address.iot.address]
}
