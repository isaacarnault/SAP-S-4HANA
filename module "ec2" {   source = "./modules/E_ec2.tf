module "ec2" {
  source = "./modules/ec2"

  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.private_subnets
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
}
