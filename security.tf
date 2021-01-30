########### Security Group

resource "aws_security_group" "knab-security" {
  vpc_id = "${aws_vpc.knab-vpc-main.id}"
  name = "ecc-security"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]  # Do not allow vm machine world wide amd put only private or know public Ip 
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]   # Do not allow vm machine world wide amd put only private or know public Ip 
  }
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]   # Do not allow vm machine world wide amd put only private or know public Ip 
  }
tags {
    Name = "knab-security"
  }
}
