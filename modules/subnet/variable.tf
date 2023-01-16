variable "subnet_count" {
  type        = number
  default     = 1
  description = "Number of subnet to be created"
}

variable "subnet_vpc_id" {
  type        = string
  default     = ""
  description = "The vpc_id the subnet will use"
}

variable "subnet_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "list of cidr blocks to be used by subnet"
}

variable "subnet_availability_zones" {
  type        = list(string)
  default     = []
  description = "list of availability zones  to be used by subnet"
}