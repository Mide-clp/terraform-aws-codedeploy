variable "name" {
  type         = string
  default      = ""
   description = "name of the security group"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "The vpc_id the security group will use"
}

variable "ingress" {
  type         = list(object())
   default     = [ ]
   description = "Ingress rules to be applied to security group"
}

variable "egress" {
  type         = list(map)
   default     = [ ]
   description = "egress rules to be applied to security group"
}