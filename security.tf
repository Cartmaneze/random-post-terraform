resource "aws_security_group" "random_post_card_http_security_group" {
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project   = "RandomPostcard"
    Terraform = true
  }
}

resource "aws_security_group" "random_post_card_ssh_security_group" {

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project   = "RandomPostcard"
    Terraform = true
  }
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.ssh_key_name
  public_key = var.ssh_public_key
}