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

  region = "ap-southeast-1"

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}