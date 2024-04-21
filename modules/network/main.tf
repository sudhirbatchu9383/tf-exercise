resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Main VPC"
  }
}

resource "aws_subnet" "subnets" {
  for_each = { for y, cidr in var.subnet_cidrs : y => cidr }

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = element(var.availability_zones, each.key)
  tags = {
    Name = "Subnet ${each.key + 1}"
  }
}

resource "aws_security_group" "sgs" {
  for_each = var.security_groups

  name        = "my-${each.key}-sg"
  description = "Security Group ${each.key}"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" { 
    for_each = each.value.ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = each.value.egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}
