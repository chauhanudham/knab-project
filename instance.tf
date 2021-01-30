#############################  docker-knab-server
resource "aws_instance" "docker-knab-server" {
  ami           = "${lookup(var.linux-ami, var.AWS_REGION)}"
  instance_type = "t2.medium"
  count = 1
    tags {
        Name = "docker-knab-server-1"
  }

  # the VPC subnet
  subnet_id = "${aws_subnet.knab-public-subnet-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.knab-security.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.sap-mykeypair.key_name}"

   # user data
  user_data = "${data.template_cloudinit_config.cloudinit-example.rendered}"

} 

################################ The End ##############################