output "s3_bucket_id" {
  value = aws_s3_bucket.postcard.id
}
output "s3_bucket_arn" {
  value = aws_s3_bucket.postcard.arn
}
output "s3_bucket_domain_name" {
  value = aws_s3_bucket.postcard.bucket_domain_name
}
output "s3_hosted_zone_id" {
  value = aws_s3_bucket.postcard.hosted_zone_id
}
output "s3_bucket_region" {
  value = aws_s3_bucket.postcard.region
}


output "arn" {
  value       = aws_ecr_repository.postcard.arn
  description = "Full ARN of the repository"
}

output "name" {
  value       = aws_ecr_repository.postcard.name
  description = "Name of the repository"
}

output "registry_id" {
  value       = aws_ecr_repository.postcard.registry_id
  description = "Registry ID where the repository was created"
}

output "repository_url" {
  value       = aws_ecr_repository.postcard.repository_url
  description = "URL of the repository"
}


output "ec2_id" {
  value       = aws_instance.web.id
  description = "EC2 instance id"
}