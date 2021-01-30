######## Key Pair 
resource "aws_key_pair" "sap-mykeypair" {
  key_name = "sap-mykeypair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
