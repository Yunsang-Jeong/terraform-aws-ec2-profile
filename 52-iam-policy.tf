##################################################
# IAM Policy
resource "aws_iam_policy" "this" {
  for_each = { for policy in var.iam_policies : policy.identifier => policy }

  name     = join("-", compact(["policy", local.name_tag_middle, each.value.name_tag_postfix]))
  policy   = each.value.policy_json
  tags     = merge(
    var.global_additional_tag,
    each.value.additional_tag,
    { 
      "Name" = join("-", compact(["policy", local.name_tag_middle, each.value.name_tag_postfix]))
    }
  )
}
##################################################