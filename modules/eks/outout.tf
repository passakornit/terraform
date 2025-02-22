output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_oidc_issuer_url" {
  value       = module.eks.cluster_oidc_issuer_url
}

output "node_iam_role_arn" {
  value = module.karpenter.node_iam_role_arn
}

output "instance_profile_name" {
  value = module.karpenter.instance_profile_name
}