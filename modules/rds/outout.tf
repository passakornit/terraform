output "rds_instance_id" {
  value       = module.rds.db_instance_identifier
}

output "rds_instance_endpoint" {
  value       = module.rds.db_instance_endpoint
}

output "rds_instance_arn" {
  value       = module.rds.db_instance_arn
}