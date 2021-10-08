provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

resource "aws_s3_bucket" "postcard" {
  bucket = "random-postcard-bucket"
  acl    = var.acl
  tags   = {
    Project   = "RandomPostcard"
    Terraform = true
  }
}

resource "aws_ecr_repository" "postcard" {
  name = "random-postcard-ecr-repository"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = var.ssh_key_name

  vpc_security_group_ids = [
    aws_security_group.random_post_card_http_security_group.id,
    aws_security_group.random_post_card_ssh_security_group.id
  ]

  tags = {
    Project   = "RandomPostcard"
    Terraform = true
  }
}