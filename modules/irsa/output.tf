output "role_arn" {
  description = "The ARN of the IAM role"
  value       = module.irsa.iam_role_arn
}

output "policy_arn" {
  description = "The ARN of the IAM policy"
  value       = aws_iam_policy.s3_access_policy.arn
}