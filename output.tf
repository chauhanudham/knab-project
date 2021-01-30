######## For Public ip print 
output "ecc-sap-server-ip" {
  value = ["${aws_instance.docker-knab-server.*.public_ip}"]
}