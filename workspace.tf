provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-08e4e35cccc6189f4"
  instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
    type = map
    default = {
        default = "t2.nano"
        dev = "t2.micro"
        prd = "t2.large"
    }
}