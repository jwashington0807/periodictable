VPC: 

-- Tied to Account. Creates a barrier to route incoming and outgoing traffic through subnets via the internet gateway. 
-- Can exist on multiple AZs in AWS within a region. 
-- Required to create an Address Space or a CIDR Block

Internet Gateway: 

-- The bridge between your VPC and the outside world

Public Subnet: 

-- Exists within your VPC. 
-- Exposed resources, such as a web application front-end, that is available to the outside world

Private Subnets: 

-- Exists within your VPC. 
-- Unlike Public Subnets, these are restricted to the outside world. This could be databases, backend configurations, etc. 

Address Space / CIDR Block: 

-- Default 10.0.0.0/16 for AWS
^-- (16) Denotes the flexibility on which digits are flexible to the left of slash
^-- (16) meaning last 2 numbers of 10.0.0.0 are flexible
^-- They are denoted in 8s. (8, 16, 24, 32)
^-- 0 - 255 possibilities for each digit 

Route Table

-- Specifies the rules for your VPC
-- Destination and Target
-- 0.0.0.0/0 essentially makes the subnet public (INTERNET). It says anybody can assess it

NAT Gateway

-- Create in public subnet so that IF you need the private subnet accessible to the outside world, they are REQUIRED to go through the NAT first
-- Not free in AWS. $30-ish a month

Security Groups
-- Applied at the instance level
-- Assigned to 1:N AWS Resources
-- Inbound and Outbound Rules
^-- Inbound 0.0.0.0/0 for all traffic
^-- Outbound for having a Security Group be able to talk with the Inbound of another Security Group

NACL
-- Stateless
-- inbound and outbound
-- Create rules to deny specific IP addresses.
-- Essentially, you could be able to get request but not send


