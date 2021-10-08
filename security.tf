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

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.random-postcard-ssh-key
  public_key = tls_private_key.pk.public_key_openssh

  tags = {
    Project   = "RandomPostcard"
    Terraform = true
  }
}