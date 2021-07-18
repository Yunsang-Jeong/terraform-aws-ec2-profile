##################################################
# IAM Role
resource "aws_iam_role" "this" {
  for_each = { for profile in var.ec2_profiles : profile.identifier => profile }
  
  name               = join("-", compact(["role", local.name_tag_middle, each.value.name_tag_postfix]))
  assume_role_policy = data.aws_iam_policy_document.assume_ec2.json
  tags               = merge(
    var.global_additional_tag,
    each.value.additional_tag,
    { 
      "Name" = join("-", compact(["role", local.name_tag_middle, each.value.name_tag_postfix]))
    }
  )
}
##################################################


##################################################
# Assume role
data "aws_iam_policy_document" "assume_ec2" {
  # Allow Codebuild service to assume this role
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type = "Service"
      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}
##################################################