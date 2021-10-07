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

resource "aws_security_group" "ssh" {
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
}

resource "aws_security_group" "http" {
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-05f7491af5eef733a"
  instance_type = "t3.micro"

  security_groups = [
    aws_security_group.ssh.id,
    aws_security_group.http.id
  ]
}