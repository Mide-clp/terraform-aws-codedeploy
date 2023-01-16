variable "vpc_id" {
  type        = string
  default     = ""
  description = "The vpc_id the subnet will use"
}

variable "name" {
  type        = string
  default     = ""
  description = "name for the load balancer"
}

variable "security_group" {
  type        = list
  default     = []
  description = "the security group to be attached too the load balancer"
}

variable "subnet" {
  type        = list
  default     = []
  description = "a list of subnets to attach to the load balancer"
}

variable "tg_name" {
  type        = string
  default     = ""
  description = "name for the load balancer target group"
}