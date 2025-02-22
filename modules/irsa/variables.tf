variable "role_name" {
  type        = string
}

variable "oidc_provider_url" {
  type        = string
}

variable "namespace" {
  type        = string
}

variable "service_account_name" {
  type        = string
}

variable "policy_name" {
  type        = string
}

variable "policy_description" {
  type        = string
}

variable "s3_actions" {
  type        = list(string)
  default     = ["s3:GetObject", "s3:PutObject", "s3:ListBucket"]
}

variable "s3_resources" {
  type        = list(string)
}

variable "tags" {
  type        = map(string)
  default     = {}
}