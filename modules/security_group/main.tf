###
# Security group module definition
###

resource "aws_security_group" "web_app_sg" {
  name    = var.sg_name
  vpc     = var.vpc_id
  ingress = var.ingress
  egress  = var.egress
  tags    = {
        "terraform": "true",
        "purpose": "web_app"
    }
}