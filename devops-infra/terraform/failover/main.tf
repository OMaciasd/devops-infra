resource "aws_route53_record" "failover_record" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "example.com"
  type    = "A"

  failover_routing_policy {
    type = "PRIMARY"
  }

  alias {
    name                   = aws_elb.primary.dns_name
    zone_id                = aws_elb.primary.zone_id
    evaluate_target_health = true
  }

  alias {
    name                   = aws_elb.secondary.dns_name
    zone_id                = aws_elb.secondary.zone_id
    evaluate_target_health = true
  }
}
