data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["aerospike-ubuntu-20.04-20210505202725"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["262212597706"]
}
