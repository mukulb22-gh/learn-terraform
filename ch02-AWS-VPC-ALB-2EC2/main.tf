terraform {

  #   cloud {
  #     organization = "learn_aws"
  #     workspaces {
  #       name = "learn-tfc-aws"
  #     }
  # 
  #   }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 2.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}


resource "aws_instance" "app_server" {
  ami                    = "ami-08d70e59c07c61a3a"
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnets[0]  # Reference a subnet from the VPC module
  vpc_security_group_ids = [aws_security_group.my_sg.id] # Attach a security group

  tags = {
    Name = var.instance_name
  }
}

resource "aws_instance" "app_server2" {
  ami                    = "ami-08d70e59c07c61a3a"
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnets[1]  # Reference a subnet from the VPC module
  vpc_security_group_ids = [aws_security_group.my_sg.id] # Attach a security group

  tags = {
    Name = var.instance_name
  }
}


resource "aws_security_group" "my_sg" {
  name        = "my_sg_via_tfc"
  description = "Security group for my EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust as needed for security
  }

  tags = {
    Name = var.instance_name
  }
}

module "alb" {
  source = "./alb"

  alb_name = "my-alb-via-tfc"
  subnet_ids                 = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]] // Use the output from VPC module for subnet
  enable_deletion_protection = false                                                        // Set deletion protection as needed


}

// More configurations for EC2 instances, security groups, etc., can be added here.

