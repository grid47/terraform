variable AWS_SECRET_KEY {}
variable AWS_ACCESS_KEY {}
variable AWS_REGION {
	default = "eu-west-1"
}

# https://cloud-images.ubuntu.com/locator/ec2/
variable "AMIS" {
	type = 	map
	default = {
		us-east-1 	= "ami-0454207e5367abf01"
		us-west-2 	= "ami-0688ba7eeeeefe3cd"
		eu-west-1 	= "ami-0f29c8402f8cce65c"
		ap-south-1 	= "ami-0f2e255ec956ade7f"
	}
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
