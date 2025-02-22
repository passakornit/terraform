include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/rds"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  identifier = "rds-instance"
  engine     = "mysql"
  engine_version = "8.0"
  family_engine = "mysql8.0"
  major_engine_version = "8.0"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  storage_type = "gp2"
  storage_encrypted = true
  db_name  = "mydatabase"
  username = "admin"
  password = "securepassword" 
  port     = 3306
  
  multi_az  = false

  create_db_subnet_group   = "true"
  vpc_security_group_ids = [dependency.vpc.outputs.security_group_id]
  subnet_ids             = dependency.vpc.outputs.private_subnets


  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  backup_retention_period = 7
  skip_final_snapshot     = true

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}