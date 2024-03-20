module "networking" {
  source               = "./modules/networking"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  availability_zones   = var.availability_zones
}

module "ec2" {
  source                 = "./modules/ec2"
  ami_id                 = module.ec2.ami_id
  instance_type          = var.instance_type
  name                   = var.name
  key_pair_name          = var.key_pair_name
  vpc_security_group_ids = [module.networking.sg_id]
  subnet_id              = module.networking.private_subnets[0]
  depends_on             = [module.networking]
}
