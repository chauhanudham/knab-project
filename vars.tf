######### Variable Define
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "sap-key"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "sap-key.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "linux-ami" {
  type = "map"
  default = {
    us-east-1 = "ami-00ddb0e5626798373"
  }
}