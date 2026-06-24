resource "aws_instance" "app_servers" {
  count         = var.ec2_instance_count
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = var.security_group_ids

  # Alternates between subnet_1 and subnet_2
  subnet_id = element(var.public_subnet_ids, count.index)

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-app-server-${count.index + 1}"
    }
  )
}