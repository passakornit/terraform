include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/irsa"
}

dependency "s3_bucket" {
  config_path = "../s3"
}

dependency "eks_cluster" {
  config_path = "../eks"
}

inputs = {
  role_name             = "irsa-role-s3-access"
  oidc_provider_url     = replace(dependency.eks_cluster.outputs.cluster_oidc_issuer_url, "https://", "")
  namespace             = "default"
  service_account_name  = "s3-access-sa"
  policy_name           = "s3-access-policy"
  policy_description    = "Policy to allow access to S3 buckets"
  s3_resources          = ["${dependency.s3_bucket.outputs.s3_bucket_arn}", "${dependency.s3_bucket.outputs.s3_bucket_arn}/*"]
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}