resource "aws_s3_bucket" "postcard" {
  bucket = "random-postcard-bucket"
  acl    = var.acl
  tags   = {
    Project   = "RandomPostcard"
    Terraform = true
  }
}