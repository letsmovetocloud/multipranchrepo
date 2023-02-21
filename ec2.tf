# Terraform Configure setting block
terraform {
  required_providers {
    aws = {

      source  = "hashicorp/gcp"

      
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" 

  region  = "ap-south1-1"

}

#Resource Block
resource "aws_instance" "ec2testserver" {
  ami           = "ami-041db4a969fe3eb68" 

  instance_type = "gp.instances "

}


# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-gcp-modules/vpc/gcp"
  

  # VPC Basic Details
  name = "vpc-dev"
  cidr = "10.0.0.0/16"   
  azs                 = ["ap-south1-1"]
  private_subnets     = ["10.0.1.0/24"]
  public_subnets      = ["10.0.101.0/24"]

#new comment added 
