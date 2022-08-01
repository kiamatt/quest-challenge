module "quest_route53_record" {
  source         = "../modules/route53_record"
  name           = "quest-${local.environment}"
  zone_id        = data.aws_route53_zone.main.zone_id
  target         = data.aws_lb.main.dns_name
  target_zone_id = data.aws_lb.main.zone_id
}

data "aws_route53_zone" "main" {
  name         = var.root_domain_name
  private_zone = false
}

data "aws_lb" "main" {
  name = var.alb_name
}
