resource "aws_subnet" "web_app_subnet" {
  vpc_id            = var.vpc_id
  count             = var.subnet_count
  cidr_block        = element(var.subnet_cidr_blocks, count.index)
  availability_zone = element(var.availability_zones, count.index)
  tags  = {
        "terraform": "true",
        "purpose": "web_app"
    }
}