module "networking"{
    source="./modules/networking"
    vpc_cidr=var.vpc_cidr
    vpc_name = var.vpc_name
    public_subnets_cidr=var.public_subnets_cidr
    private_subnets_cidr=var.private_subnets_cidr
    availability_zones = var.availability_zones
}

module "ec2"{
    source = "./modules/ec2"
    ami = var.ami
    instance_type= var.instance_type
    name = var.name
    key_name=var.key_name
    vpc_security_group_ids=[module.networking.security_group_id]
    subnet_id= module.networking.public_subnet_id
}

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["804295906245"] # Canonical
# }