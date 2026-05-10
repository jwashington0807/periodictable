# Local variables
locals {
  vpc_name = "${var.projectname}-${var.environment}-vpc"
}

resource "aws_instance" "app_servers" {
  count         = var.ec2_instance_count
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  # Alternates between subnet_1 and subnet_2
  subnet_id = element(var.public_subnet_ids, count.index)

  tags = {
    Name = "${local.vpc_name}_app_server_${count.index + 1}"
  }
}