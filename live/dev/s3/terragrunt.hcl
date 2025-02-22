include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/s3"
}

inputs = {
  region      = "ap-southeast-1"
  bucket_name = "eks-app-s3-bucket"
  versioning_enabled = true
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}