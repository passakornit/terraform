locals {
  parsed = regex(".*/live/(?P<env>.*?)/.*", get_terragrunt_dir())
  env    = local.parsed.env
}

# Configure S3 as a backend
remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-exp-${local.env}"
    region         = "ap-southeast-1"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    use_lockfile   = true
    encrypt        = true
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

# Generate provider configuration
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "ap-southeast-1"
}
EOF
}