provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "ami-408c7f28"
  instance_type = "t1.micro"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}" 
}

output "ip" {
    value = "${aws_eip.ip.public_ip}"
}

#resource "aws_instance" "another" {
#  ami           = "ami-408c7f28"
#  instance_type = "t1.micro"
#
#  provisioner "local-exec" {
#    command = "echo ${aws_instance.another.public_ip} > another.ip_address.txt"
#  }
#}
