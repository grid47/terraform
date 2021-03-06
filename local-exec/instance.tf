
resource "aws_key_pair" "yasirs-key" {
  key_name = "yasirs-key"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "example" {
	ami = "${ lookup(var.AMIS, var.AWS_REGION) }"
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.yasirs-key.key_name}"

	provisioner "local-exec" {
		command = "echo ${aws_instance.example.private_ip} > private_ips.txt"
	}

	output "ip" {
		value = "${aws_instance.example.public_ip}"
	}

}
