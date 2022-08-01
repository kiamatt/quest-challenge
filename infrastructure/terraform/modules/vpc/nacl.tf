resource "aws_network_acl" "public" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = [aws_subnet.public0.id, aws_subnet.public1.id]
}

resource "aws_network_acl" "private" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = [aws_subnet.private0.id, aws_subnet.private1.id]
}

resource "aws_network_acl_rule" "public_variable_ingress_rules" {
  count          = length(var.public_nacl_ingress_rules)
  network_acl_id = aws_network_acl.public.id
  rule_number    = var.public_nacl_ingress_rules[count.index].rule_number
  protocol       = var.public_nacl_ingress_rules[count.index].protocol
  rule_action    = "allow"
  cidr_block     = var.public_nacl_ingress_rules[count.index].cidr
  from_port      = var.public_nacl_ingress_rules[count.index].from_port
  to_port        = var.public_nacl_ingress_rules[count.index].to_port
}

resource "aws_network_acl_rule" "public_variable_egress_rules" {
  count          = length(var.public_nacl_egress_rules)
  network_acl_id = aws_network_acl.public.id
  rule_number    = var.public_nacl_egress_rules[count.index].rule_number
  protocol       = var.public_nacl_egress_rules[count.index].protocol
  rule_action    = "allow"
  cidr_block     = var.public_nacl_egress_rules[count.index].cidr
  from_port      = var.public_nacl_egress_rules[count.index].from_port
  to_port        = var.public_nacl_egress_rules[count.index].to_port
  egress         = true
}

resource "aws_network_acl_rule" "private_variable_ingress_rules" {
  count          = length(var.private_nacl_ingress_rules)
  network_acl_id = aws_network_acl.private.id
  rule_number    = var.private_nacl_ingress_rules[count.index].rule_number
  protocol       = var.private_nacl_ingress_rules[count.index].protocol
  rule_action    = "allow"
  cidr_block     = var.private_nacl_ingress_rules[count.index].cidr
  from_port      = var.private_nacl_ingress_rules[count.index].from_port
  to_port        = var.private_nacl_ingress_rules[count.index].to_port
}

resource "aws_network_acl_rule" "private_variable_egress_rules" {
  count          = length(var.private_nacl_egress_rules)
  network_acl_id = aws_network_acl.private.id
  rule_number    = var.private_nacl_egress_rules[count.index].rule_number
  protocol       = var.private_nacl_egress_rules[count.index].protocol
  rule_action    = "allow"
  cidr_block     = var.private_nacl_egress_rules[count.index].cidr
  from_port      = var.private_nacl_egress_rules[count.index].from_port
  to_port        = var.private_nacl_egress_rules[count.index].to_port
  egress         = true
}
