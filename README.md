# terraform-cloudflare-dns-https

Create ServiceMode [DNS HTTPS records](https://kalfeher.com/https-records-simple/) in Cloudflare.

The Zone ID can be found on the Cloudflare overview page for the domain you
want to add records to.

## Usage

To create an HTTPS record saying `example.com` is available via http/2 over TLS:

```hcl
module "tea_sh_https" {
  source  = "brainsik/dns-https/cloudflare"
  zone_id = "313372600deadcodebea5751993defc0"
  name    = "example.com"

  alpn = "h2"
}
```

To create an HTTPS record saying `example.com` is available via http/3 or http/2 over TLS with IPs to use for initially establishing a connection:

```hcl
module "tea_sh_https" {
  source  = "brainsik/dns-https/cloudflare"
  zone_id = "313372600deadcodebea5751993defc0"
  name    = "example.com"

  alpn     = "h3,h2"
  ipv4hint = "192.0.2.1"
  ipv6hint = "2001:db8::1,2001:db8::2"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.https](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alpn"></a> [alpn](#input\_alpn) | A comma separated list of short form ALPN identifiers (e.g., "h2" or "h3,h2") | `string` | n/a | yes |
| <a name="input_ipv4hint"></a> [ipv4hint](#input\_ipv4hint) | A comma separated list of IPs | `string` | `""` | no |
| <a name="input_ipv6hint"></a> [ipv6hint](#input\_ipv6hint) | A comma separated list of IPs | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the record | `string` | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | Resource record priority | `number` | `1` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The Cloudflare DNS zone ID to add the record to | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
