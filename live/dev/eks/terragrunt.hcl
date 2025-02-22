include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/eks"
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id     = "mock-vpc-output"
    private_subnets = ["subnet-12345678", "subnet-87654321"]
  }

  # Optional: Disable mocking when the dependency is applied
  mock_outputs_allowed_terraform_commands = ["plan", "validate"]
}



inputs = {
  cluster_name    = "dev-eks-cluster"
  cluster_version = "1.32"

  bootstrap_self_managed_addons = false
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id                   = dependency.vpc.outputs.vpc_id
  subnet_ids               = dependency.vpc.outputs.private_subnets
  control_plane_subnet_ids = dependency.vpc.outputs.private_subnets

  # Private cluster configuration
  cluster_endpoint_public_access  = false
  cluster_endpoint_private_access = true
  #cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    eks-nodegroup = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.medium"]
      min_size     = 2
      max_size     = 3
      desired_size = 2
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}




