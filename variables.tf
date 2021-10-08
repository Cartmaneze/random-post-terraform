variable "aws_access_key" {
  type        = string
  sensitive   = true
}
variable "aws_secret_key" {
  type        = string
  sensitive   = true
}
variable "random-postcard-ssh-key" {
  type        = string
  sensitive   = true
}
variable "region" {
  default = "eu-central-1"
}
variable "acl" {
  default = "private"
}