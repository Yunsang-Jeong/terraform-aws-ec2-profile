##################################################
# Attach iam policy to iam role
resource "aws_iam_role_policy_attachment" "user_policies" {
  for_each = { for p in var.attach_user_policies : p.profile_identifier => p.policy_identifier }

  role       = lookup(aws_iam_role.this, each.key).name
  policy_arn = lookup(aws_iam_policy.this, each.value).arn
}
##################################################

##################################################
# Attach iam policy to iam role
resource "aws_iam_role_policy_attachment" "managed_policies" {
  for_each = { for p in var.attach_managed_policy : p.profile_identifier => p.managed_policy_arn }

  role       = lookup(aws_iam_role.this, each.key).name
  policy_arn = each.value
}
##################################################