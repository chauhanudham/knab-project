############# Internet VPC
resource "aws_vpc" "knab-vpc-main" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "knab-vpc-main"
    }
}

############# Subnets For Public
resource "aws_subnet" "knab-public-subnet-1" {
    vpc_id = "${aws_vpc.knab-vpc-main.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"

    tags {
        Name = "knab-public-subnet-1"
    }
}

############# Subnets For Private

resource "aws_subnet" "knab-private-subnet-1" {
    vpc_id = "${aws_vpc.knab-vpc-main.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1a"

    tags {
        Name = "knab-private-subnet-1"
    }
}

#############  Internet GW For Public Subnet
resource "aws_internet_gateway" "knab-vpc-igw" {
    vpc_id = "${aws_vpc.knab-vpc-main.id}"

    tags {
        Name = "knab-vpc-igw"
    }
}

############# Create route to the internet in Route tables For Public Subnet
resource "aws_route_table" "knab-public-subnet" {
    vpc_id = "${aws_vpc.knab-vpc-main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.knab-vpc-igw.id}"
    }

    tags {
        Name = "knab-public-subnet-1"
    }
}

############# Create Elastic IP (EIP)

resource "aws_eip" "tuto_eip" {
  vpc      = true
  depends_on = ["aws_internet_gateway.knab-vpc-igw"]
}

############# Create Nat Gateway

resource "aws_nat_gateway" "knab-nat-gateway" {
    allocation_id = "${aws_eip.tuto_eip.id}"
    subnet_id = "${aws_subnet.knab-public-subnet-1.id}"
    depends_on = ["aws_internet_gateway.knab-vpc-igw"]

    tags {
        Name = "knab-public-subnet-1"
    }

}

############# Create route to the internet by Route tables For Private Subnet
resource "aws_route_table" "knab-private-subnet" {
    vpc_id = "${aws_vpc.knab-vpc-main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.knab-nat-gateway.id}"
    }

    tags {
        Name = "knab-private-subnet-1"
    }
}

#############  Route associations public
resource "aws_route_table_association" "knab-public-subnet-1-a" {
    subnet_id = "${aws_subnet.knab-public-subnet-1.id}"
    route_table_id = "${aws_route_table.knab-public-subnet.id}"
}

#############  Route associations private

resource "aws_route_table_association" "knab-private-subnet-1-a" {
    subnet_id = "${aws_subnet.knab-private-subnet-1.id}"
    route_table_id = "${aws_route_table.knab-private-subnet.id}"
}


################### The End ##################