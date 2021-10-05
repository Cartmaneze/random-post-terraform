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