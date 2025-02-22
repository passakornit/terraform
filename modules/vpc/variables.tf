variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "region" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "security_group_name_prefix" {
  type        = string
  default     = null
}

variable "db_port" {
  type        = string
  default     = null
}

variable "create_database_subnet_group" {
  type        = bool
  default     = true
}

variable "database_subnet_group_name" {
  type        = string
  default     = null
}

variable "map_public_ip_on_launch" {
  type        = bool
  default     = false
}

variable "enable_nat_gateway" {
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  type        = bool
  default     = false
}