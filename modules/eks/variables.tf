variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "cluster_addons" {
  type = any
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "control_plane_subnet_ids" {
  type = list(string)
}

variable "cluster_endpoint_public_access" {
  type = bool
}

variable "cluster_endpoint_private_access" {
  type = bool
}

# variable "cluster_endpoint_public_access_cidrs" {
#   type = list(string)
# }

variable "enable_cluster_creator_admin_permissions" {
  type = bool
}

variable "eks_managed_node_groups" {
  type = any
}

variable "tags" {
  type = map(string)
}

