resource "aws_instance" "reserved_instance" {
  ami             = "ami-0c55b159cbfafe1f0"
  instance_type   = "t3.medium"
  instance_count  = 1
  availability_zone = "us-west-2a"
  reserved        = true
}
