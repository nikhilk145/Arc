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

resource "aws_instance" "arc_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id     = var.subnet_id
  associate_public_ip_address=true
  tags = {
    Name = "${var.name}-instance"
  }
}

resource "aws_key_pair" "this" {
  key_name        = var.key_name
  public_key      = trimspace(tls_private_key.this[0].public_key_openssh)
}

################################################################################
# Private Key
################################################################################

resource "tls_private_key" "this" {
  count = 1
  algorithm = var.private_key_algorithm
  rsa_bits  = var.private_key_rsa_bits
}
