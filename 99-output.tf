output "ec2_profile_arns" {
  description = "The arn of ec2 profiles"
  value       = { for identifier, profile in aws_iam_instance_profile.this : identifier => profile.arn }
}