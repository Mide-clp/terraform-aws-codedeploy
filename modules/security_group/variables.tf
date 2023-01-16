variable "sg_name" {
  type         = string
  default      = ""
   description = "name of the security group"
}

variable "sg_vpc_id" {
  type        = string
  default     = ""
  description = "The vpc_id the security group will use"
}

variable "ingress_rule" {
  type         = list(any)
   default     = [ ]
   description = "Ingress rules to be applied to security group"
}

variable "egress_rule" {
  type         = list(any)
   default     = [ ]
   description = "egress rules to be applied to security group"
}