##################################################
# EC2 Profile
resource "aws_iam_instance_profile" "this" {
  for_each = { for profile in var.ec2_profiles : profile.identifier => profile }
  
  role     = lookup(aws_iam_role.this, each.key).name
  name     = join("-", compact(["profile", local.name_tag_middle, each.value.name_tag_postfix]))
}
##################################################