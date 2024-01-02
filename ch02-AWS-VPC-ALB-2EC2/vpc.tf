# Define the module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0" # Use a specific version for consistency

  # Basic VPC configuration
  name                 = "my-vpc-via-tfc"
  cidr                 = "10.0.0.0/16"
  azs                  = ["us-west-2a", "us-west-2b"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets       = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway   = true
  enable_dns_hostnames = true

  # Additional configuration options
  enable_ipv6 = false # Enable IPv6 if needed
  #assign_generated_ipv6_cidr_block  = true
  public_subnet_tags  = { Name = "Public subnet via TFC" }
  private_subnet_tags = { Name = "Private subnet via TFC" }

  # Security-related options
  #enable_flow_logs       = false  # Enable VPC flow logging
  #flow_logs_destination_arn = "arn:aws:logs:us-east-1:123456789012:log-group:vpc-flow-logs:*"
  #enable_dns_hostnames_support = true  # Enable DNS hostnames for instances

  # Tags for the VPC
  tags = {
    Name        = "My VPC via TFC"
    Environment = "Development"
  }
}
