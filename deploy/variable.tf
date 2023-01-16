variable "subnet_count" {
  type        = number
  default     = 3
  description = "Number of subnet needed"
}

variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "cidr block for the subnet"
}

variable "subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "list of cidr blocks to be used by subnet"
}

variable "subnet_availability_zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "list of availability zones to be used by subnet"
}

variable "sg_name" {
  type         = string
  default      = ""
  description  = "name of the security group"
}

variable "egress_rule" {
  type         = list(any)
   default     = [
    {
        description = "for all outgoing traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        prefix_list_ids = []
        security_groups = []
        self = false
    }
   ]
   description = "egress rules to be applied to security group"
}