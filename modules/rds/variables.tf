variable "identifier" {
  type        = string
}

variable "engine" {
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  type        = string
  default     = "5.7"
}

variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  type        = number
  default     = 20
}

variable "storage_type" {
  type        = string
  default     = "gp2"
}

variable "storage_encrypted" {
  type        = bool
  default     = true
}

variable "kms_key_id" {
  type        = string
  default     = null
}

variable "db_name" {
  type        = string
}

variable "username" {
  type        = string
}

variable "password" {
  type        = string
  sensitive   = true
}

variable "port" {
  type        = number
  default     = 3306
}

variable "vpc_security_group_ids" {
  type        = list(string)
}

variable "db_subnet_group_name" {
  type        = string
  default     = null
}

variable "subnet_ids" {
  type        = list(string)
}

variable "maintenance_window" {
  type        = string
  default     = "Mon:00:00-Mon:03:00"
}

variable "backup_window" {
  type        = string
  default     = "03:00-06:00"
}

variable "backup_retention_period" {
  type        = number
  default     = 7
}

variable "skip_final_snapshot" {
  type        = bool
  default     = true
}

variable "family_engine" {
  type        = string
  default     = "mysql5.7"
}

variable "major_engine_version" {
  type        = string
  default     = "5.7"
}

variable "multi_az" {
  type        = bool
  default     = false
}

variable "tags" {
  type        = map(string)
  default     = {}
}

variable "create_db_subnet_group" {
  type        = bool
  default     = false
}
