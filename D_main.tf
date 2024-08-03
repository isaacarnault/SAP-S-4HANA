terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.21.0"

  name = "s4hana-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id     = module.vpc.vpc_id
  subnets    = module.vpc.private_subnets
  ami_id     = var.ami_id
  instance_type = var.instance_type
  key_name   = var.key_name
  security_group_ids = [aws_security_group.sap_s4hana_sg.id]
}
    module "rds" {
  source = "./rds"

  db_username = var.db_username
  db_password = var.db_password
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.private_subnets
}

module "sap" {
  source = "./sap_installation"

  ami_id              = var.ami_id
  instance_type       = var.instance_type
  key_name            = var.key_name
  subnets             = module.vpc.private_subnets
  security_group_ids  = [aws_security_group.sap_s4hana_sg.id]
  db_host             = aws_db_instance.sql_server.address
  db_username         = var.db_username
  db_password         = var.db_password
}

