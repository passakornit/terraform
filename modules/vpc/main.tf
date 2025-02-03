module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = var.tags
}



# VPC Endpoints for Private EKS
resource "aws_vpc_endpoint" "eks" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.eks"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.vpc_endpoint.id]
  subnet_ids         = module.vpc.private_subnets

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.vpc_endpoint.id]
  subnet_ids         = module.vpc.private_subnets

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = module.vpc.private_route_table_ids
}

resource "aws_vpc_endpoint" "sts" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.sts"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.vpc_endpoint.id]
  subnet_ids         = module.vpc.private_subnets

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.logs"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_security_group.vpc_endpoint.id]
  subnet_ids         = module.vpc.private_subnets

  private_dns_enabled = true
}

# Security Group for VPC Endpoints
resource "aws_security_group" "vpc_endpoint" {
  name_prefix = "vpc-endpoint-sg-"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
