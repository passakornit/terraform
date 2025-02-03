module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_addons = var.cluster_addons

  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  control_plane_subnet_ids = var.control_plane_subnet_ids

  # Disable public access to the cluster endpoint
  cluster_endpoint_public_access  = false
  cluster_endpoint_private_access = true

  # Enable cluster creator admin permissions
  enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions

  # Managed node groups
  eks_managed_node_groups = var.eks_managed_node_groups

  tags = var.tags
}
