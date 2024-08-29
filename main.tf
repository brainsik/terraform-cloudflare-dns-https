locals {
  ipv4hint = var.ipv4hint != "" ? " ipv4hint=\"${var.ipv4hint}\"" : ""
  ipv6hint = var.ipv6hint != "" ? " ipv6hint=\"${var.ipv6hint}\"" : ""
}

resource "cloudflare_record" "https" {
  zone_id = var.zone_id
  name    = var.name
  type    = "HTTPS"
  ttl     = 1

  data {
    priority = var.priority
    target   = "."
    value    = "alpn=\"${var.alpn}\"${local.ipv4hint}${local.ipv6hint}"
  }
}
