resource "aws_key_pair" "yasirs-key" {
  key_name = "yasirs-key"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "example" {
	ami = "${ lookup(var.AMIS, var.AWS_REGION) }"
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.yasirs-key.key_name}"

	provisioner "file" {
		source = "script.sh"
		destination = "/tmp/script.sh"
	}

	provisioner "remote-exec" {
		inline = [
			"sudo chmod +x /tmp/script.sh",
			"sudo sh /tmp/script.sh"
		]
	}
	connection {
		user = "${var.INSTANCE_USERNAME}"
		host = "${self.public_ip}"
		private_key = "${file(var.PATH_TO_PRIVATE_KEY)}"
	}
}
