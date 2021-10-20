variable "account_id" {
  type        = string
  sensitive   = true
}
variable "aws_access_key" {
  type        = string
  sensitive   = true
}
variable "aws_secret_key" {
  type        = string
  sensitive   = true
}
variable "ssh_key_name" {
  type        = string
  sensitive   = true
}
variable "ssh_public_key" {
  type        = string
  sensitive   = true
}
variable "region" {
  default = "eu-central-1"
}
variable "acl" {
  default = "private"
}
variable "ecr_repository_name" {
  default = "random-postcard-ecr-repository"
}