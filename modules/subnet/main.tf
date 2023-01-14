resource "aws_subnet" "name" {
  count = var.subnet_count
  cidr_block = element(var.subnet_cidr_blocks, count.index)
  availability_zone = element(var.availability_zones, count.index)
}