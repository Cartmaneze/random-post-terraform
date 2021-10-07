provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

resource "aws_s3_bucket" "postcard" {
  bucket = "random-postcard-bucket"
  acl    = var.acl
  tags   = {
    Project = "pet-project-Nikita"
  }
}

resource "aws_ecr_repository" "postcard" {
  name = "random-postcard-ecr-repository"
}

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
}

resource "aws_instance" "web" {
  ami           = "ami-03d88eb7436f92fdd"
  instance_type = "t3.micro"

  vpc_security_group_ids  = [
    aws_security_group.random_post_card_http_security_group.id,
    aws_security_group.random_post_card_ssh_security_group.id
  ]
}