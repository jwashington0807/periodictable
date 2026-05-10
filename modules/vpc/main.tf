# Local variables
locals {
  vpc_name = "${var.projectname}-${var.environment}-vpc"
}

# Define a VPC
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags = { 
        Environment = var.environment
        Name = local.vpc_name
    }
}

# Define public subnets for availability zone
resource "aws_subnet" "periodictable_vpc_public_subnets" {
    count            = length(var.public_subnets)
    vpc_id            = aws_vpc.main.id
    cidr_block        = var.public_subnets[count.index]
    availability_zone = var.aws_availability_zones[count.index]
    map_public_ip_on_launch = true
    tags = { 
        Environment = var.environment
        Name = "${local.vpc_name}_public_subnet_${count.index + 1}" 
    }
}

# Define private subnets for availability zone
resource "aws_subnet" "periodictable_vpc_private_subnets" {
    count            = length(var.private_subnets)
    vpc_id            = aws_vpc.main.id
    cidr_block        = var.private_subnets[count.index]
    availability_zone = var.aws_availability_zones[count.index]
    map_public_ip_on_launch = false
    tags = { 
        Environment = var.environment
        Name = "${local.vpc_name}_private_subnet_${count.index + 1}" 
    }
}

# Define an Internet Gateway and attach it to the VPC
resource "aws_internet_gateway" "periodictable_gateway" {
    vpc_id = aws_vpc.main.id
    tags = { 
        Environment = var.environment
        Name = "${local.vpc_name}_internet_gateway" 
    }
}

# Define a route table for subnets and associate it with the Internet Gateway
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.periodictable_gateway.id
    }
    tags = { 
        Environment = var.environment
        Name = "${local.vpc_name}_public_route_table" 
    }
}

# Associate the public subnets with the route table
resource "aws_route_table_association" "public_zones" {
    count         = length(var.public_subnets)
    subnet_id      = aws_subnet.periodictable_vpc_public_subnets[count.index].id
    route_table_id = aws_route_table.public.id
}

# resource "aws_route_table_association" "private_zones" {
#     count         = length(var.private_subnets)
#     subnet_id      = aws_subnet.periodictable_vpc_private_subnets[count.index].id
#     route_table_id = aws_route_table.private.id
# }