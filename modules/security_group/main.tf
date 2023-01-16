###
# Security group module definition
###

resource "aws_security_group" "web_app_sg" {
  name    = var.sg_name
  description = "Allow web traffics"
  vpc_id  = var.sg_vpc_id
  ingress = var.ingress_rule
  egress  = var.egress_rule
  tags    = {
        "terraform": "true",
        "purpose": "web_app"
    }
}