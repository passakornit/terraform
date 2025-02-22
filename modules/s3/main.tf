module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.6"

  bucket = var.bucket_name

  versioning = {
    enabled = var.versioning_enabled
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
  # Tags
  tags = var.tags
}
