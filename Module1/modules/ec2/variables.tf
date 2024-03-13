variable "ami"{
    type        = string
    description = "AMI for the EC2 instance"
}

variable "instance_type"{
    type        = string
    description = "EC2 Instance Type"
}

variable "key_name"{
    type        = string
    description = "SSH key name for EC2 instance"
}

variable "name"{
    type        = string
    description = "Name of the instance"
}

variable "subnet_id" { }
variable "vpc_security_group_ids" {
    type        = list(string)
}

variable "private_key_algorithm" {
  description = "Name of the algorithm to use when generating the private key. Currently-supported values are `RSA` and `ED25519`"
  type        = string
  default     = "RSA"
}
variable "private_key_rsa_bits" {
  description = "When algorithm is `RSA`, the size of the generated RSA key, in bits (default: `4096`)"
  type        = number
  default     = 4096
}
# variable "key_name" {
#   description = "The name for the key pair. Conflicts with `key_name_prefix`"
#   type        = string
#   default     = null
# }