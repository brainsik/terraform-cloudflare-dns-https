variable "zone_id" {
  description = "The Cloudflare DNS zone ID to add the record to"

  type = string
}

variable "name" {
  description = "The name of the record"

  type = string
}

variable "priority" {
  description = "Resource record priority"

  type    = number
  default = 1
}

variable "alpn" {
  description = "A comma separated list of short form ALPN identifiers (e.g., \"h2\" or \"h3,h2\")"

  type = string
}

variable "ipv4hint" {
  description = "A comma separated list of IPs"

  type    = string
  default = ""
}

variable "ipv6hint" {
  description = "A comma separated list of IPs"

  type    = string
  default = ""
}
