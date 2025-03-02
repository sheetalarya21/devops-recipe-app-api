terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.23.0"
    }
  }

  backend "s3" {
    bucket = "devops-recipe-app-tfs-state"
    key = "tfs-state-setup"
    region = "ap-south-1"
    encrypt = true
    dynamodb_table = "devops-recipe-app-api-tfs-lock"
  }
}

provider "aws" {
    region = "ap-south-1"

    default_tags {
       tags = {
        Environment = terraform.workspace
        Project = var.project
        contact = var.contact
        ManageBy = "Terraform/setup"
       }
    }
  
}
