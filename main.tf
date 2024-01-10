provider "aws" {
  region = "ap-southeast-1"  # Adjust as needed
}

variable "create_s3" {
  type = bool
}

resource "aws_s3_bucket" "my_bucket" {
  count = var.create_s3 ? 1 : 0
  bucket = "my-bucket-${count.index + 1}"
  
}

resource "aws_instance" "my_instance" {
  count = var.create_s3 ? 0 : 1
  ami           = "ami-0c55b159cbfafe1f0"  # Change to a suitable AMI
  instance_type = "t2.micro"
}
