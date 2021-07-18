ec2_profiles = [{
  identifier = "bastion"
  name_tag_postfix = "bastion"
},{
  identifier = "web"
  name_tag_postfix = "web"
}]

# iam_policies = [{
#   identifier = "my-policy"
#   policy_json = file("my-policy.json")
#   name_tag_postfix = "my-policy"
# }]

# attach_user_policies = [{
#   profile_identifier = "bastion"
#   policy_identifier  = "my-policy"
# },{
#   profile_identifier = "web"
#   policy_identifier  = "my-policy"
# }]

attach_managed_policy = [{
  profile_identifier = "bastion"
  managed_policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
},{
  profile_identifier = "web"
  managed_policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}]