variable "region" {
  type        = string
  default     = "us-east-2"
  description = "AWS region where the resources need to be created"
}
variable "vpc_cidr" {
  description = "CIDR range for vpc"
  type        = string
  # default =         = "172.29.31.0/25"
  default = "172.29.31.0/25"
}

variable "vpc_name" {
  description = "Name of the vpc"
  type        = string
  default     = "arc-demo"
}
variable "name" {
  description = "Name of the vpc"
  type        = string
  default     = "arc-demo"
}

variable "public_subnets_cidr" {
  description = "list of public subnet CIDR blocks"
  type        = list(string)
  default     = ["172.29.31.0/27", "172.29.31.32/27"]
}

variable "private_subnets_cidr" {
  description = "list of private subnet CIDR blocks"
  type        = list(string)
  default     = ["172.29.31.64/27", "172.29.31.96/27"]
}

variable "availability_zones" {
  description = "list of availability zones"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b"]
}

variable "key_pair_name" {
  type    = string
  default = "demo-key"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
  default     = "t2.micro"
}

# variable "ami" {
#   default = "ami-01387af90a62e3c01"
# }
