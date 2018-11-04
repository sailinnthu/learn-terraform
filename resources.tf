resource "aws_vpc" "demo" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags {
    Name     = "demo"
    Location = "Singapore"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id = "${aws_vpc.demo.id}"

  #assign cidr_block using built-in function cidrsubnet interpolation
  cidr_block        = "${cidrsubnet(aws_vpc.demo.cidr_block, 8, 4)}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "Subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = "${aws_vpc.demo.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.demo.cidr_block, 8, 5)}"
  availability_zone = "ap-southeast-1b"

  tags {
    Name = "Subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id            = "${aws_vpc.demo.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.demo.cidr_block, 8, 6)}"
  availability_zone = "ap-southeast-1c"

  tags {
    Name = "Subnet3"
  }
}
