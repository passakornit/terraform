module "rds" {
  source = "terraform-aws-modules/rds/aws"
  version = "~> 6.10.0"

  identifier = var.identifier

  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  storage_encrypted    = var.storage_encrypted
  kms_key_id           = var.kms_key_id

  db_name  = var.db_name
  username = var.username
  password = var.password
  port     = var.port

  create_db_subnet_group = var.create_db_subnet_group
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_ids             = var.subnet_ids
  multi_az  = var.multi_az 

  family = var.family_engine
  major_engine_version = var.major_engine_version

  maintenance_window = var.maintenance_window
  backup_window      = var.backup_window

  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = var.skip_final_snapshot

  tags = var.tags
}