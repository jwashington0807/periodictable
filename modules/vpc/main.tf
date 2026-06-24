# Define a VPC
resource "aws_vpc" "main" {
    cidr_block = var.cidr_block
    tags = merge(
        var.tags,
        {
            Name = "${var.name_prefix}-vpc"
        }
    )
}

# Define public subnets for availability zone
resource "aws_subnet" "periodictable_vpc_public_subnets" {
    count            = length(var.public_subnets)
    vpc_id            = aws_vpc.main.id
    cidr_block        = var.public_subnets[count.index]
    availability_zone = var.aws_availability_zones[count.index]
    map_public_ip_on_launch = true
    tags = merge(
        var.tags,
        {
            Name = "${var.name_prefix}-public-subnet-${count.index + 1}"
        }
    )
}

# Define private subnets for availability zone
resource "aws_subnet" "periodictable_vpc_private_subnets" {
    count            = length(var.private_subnets)
    vpc_id            = aws_vpc.main.id
    cidr_block        = var.private_subnets[count.index]
    availability_zone = var.aws_availability_zones[count.index]
    // Don't assign public IPs to private subnets
    map_public_ip_on_launch = false
    tags = merge(
        var.tags,
        {
            Name = "${var.name_prefix}-private-subnet-${count.index + 1}"
        }
    )
}

resource "aws_eip" "nat" {
    domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
    subnet_id     = aws_subnet.periodictable_vpc_public_subnets[0].id
    allocation_id = aws_eip.nat.id

    depends_on = [
        aws_internet_gateway.periodictable_gateway
    ]

    tags = merge(
        var.tags,
        {
            Name = "${var.name_prefix}-nat-gateway"
        }
    )
}

# Define an Internet Gateway and attach it to the VPC
resource "aws_internet_gateway" "periodictable_gateway" {
    vpc_id = aws_vpc.main.id
    tags = merge(
        var.tags,
        {
            Name = "${var.name_prefix}-internet-gateway"
        }
    )
}

# Define a route table for subnets and associate it with the Internet Gateway
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.periodictable_gateway.id
    }
    tags = merge(
        var.tags,
        {
            Name = "${var.name_prefix}-public-route-table"
        }
    )
}

# Define a route table for subnets and associate it with the NAT gateway
resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }
    tags = merge(
        var.tags,
        {
            Name = "${var.name_prefix}-private-route-table"
        }
    )
}

# Associate the public subnets with the route table
resource "aws_route_table_association" "public_zones" {
    count         = length(var.public_subnets)
    subnet_id      = aws_subnet.periodictable_vpc_public_subnets[count.index].id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_zones" {
    count         = length(var.private_subnets)
    subnet_id      = aws_subnet.periodictable_vpc_private_subnets[count.index].id
    route_table_id = aws_route_table.private.id
}