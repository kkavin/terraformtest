
# Resource Block
#Create VPC

resource "aws_vpc" "vpc_test" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "vpc-test"
    }
  
}


#Create Subnets

resource "aws_subnet" "public_subnet1" {
    vpc_id = aws_vpc.vpc_test.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "eu-west-1a"
    map_public_ip_on_launch = true
}


# Internet Gateway


resource "aws_internet_gateway" "vpc_test_igw" {
  vpc_id = aws_vpc.vpc_test.id  
}


# Route Table

resource "aws_route_table" "vpc_test_route_table" {
    vpc_id = aws_vpc.vpc_test.id
  
}

# Route table internet access

resource "aws_route" "vpc_test_public_route" {
    route_table_id = aws_route_table.vpc_test_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_test_igw.id
  
}


# Associate the route table with the subnet

resource "aws_route_table_association" "vpc_test_route_table_association" {
    route_table_id = aws_route_table.vpc_test_route_table.id
    subnet_id = aws_subnet.public_subnet1.id
  
}


#Create security group

resource "aws_security_group" "vpc_test_sg" {
  name        = "vpc_test_sg"
  description = "vpc_test_sg"
  vpc_id      =  aws_vpc.vpc_test.id

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


