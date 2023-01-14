variable "subnet_count" {
  type        = number
  default     = 3
  description = "Number of subnet to be created"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "The vpc_id the subnet will use"
}

variable "subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "list of cidr blocks to bee used by subnet"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "list of availability zones  to be used by subnet"
}