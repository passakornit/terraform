include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/vpc"
}

inputs = {
  vpc_name = "dev-vpc"
  vpc_cidr = "10.0.0.0/16"

  azs            = ["ap-southeast-1a", "ap-southeast-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  create_database_subnet_group = true
  database_subnet_group_name = "rds-subnet"
  map_public_ip_on_launch = true
  enable_nat_gateway = true
  single_nat_gateway = true


  region = "ap-southeast-1"

  security_group_name_prefix = "dev-test-sg-"
  db_port = 3306


  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}