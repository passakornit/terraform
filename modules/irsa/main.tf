module "irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "~> 5.52.2"

  create_role = true

  role_name = var.role_name

  provider_url = var.oidc_provider_url

  oidc_fully_qualified_subjects = [
    "system:serviceaccount:${var.namespace}:${var.service_account_name}"
  ]

  role_policy_arns = [
    aws_iam_policy.s3_access_policy.arn
  ]

  tags = var.tags
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = var.policy_name
  description = var.policy_description

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = var.s3_actions
        Resource = var.s3_resources
      }
    ]
  })
}