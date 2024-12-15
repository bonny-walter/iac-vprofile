terraform {
  # Specify required Terraform version
  required_version = "1.9.8"

  # Declare required providers with flexible version constraints
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.25.0, < 6.0.0" # Ensures compatibility with AWS provider updates
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5" # Allows compatible updates within the 3.x minor version
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0" # Ensures stability while allowing bug fixes and minor improvements
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3" # Matches any compatible version in 2.3.x
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23" # Allows updates within the 2.x version, starting from 2.23.x
    }
  }

  # S3 backend for remote state management
  backend "s3" {
    bucket = "bonny-aws-bucket"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
