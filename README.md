# Overview

AWS EC2 instance에 사용할 iam profile을 생성하는 모듈입니다. 하단의 내용은 `terraform-docs`에 의해 생성되었습니다.

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.35.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.35.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_managed_policy"></a> [attach\_managed\_policy](#input\_attach\_managed\_policy) | The attachment of iam policies created by aws | <pre>list(object({<br>    profile_identifier = string<br>    managed_policy_arn = string<br>  }))</pre> | `[]` | no |
| <a name="input_attach_user_policies"></a> [attach\_user\_policies](#input\_attach\_user\_policies) | The attachment of iam policies created by user | <pre>list(object({<br>    profile_identifier = string<br>    policy_identifier  = string<br>  }))</pre> | `[]` | no |
| <a name="input_ec2_profiles"></a> [ec2\_profiles](#input\_ec2\_profiles) | The list of ec2 profiles | <pre>list(object({<br>    identifier       = string<br>    name_tag_postfix = string<br>    additional_tag   = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_global_additional_tag"></a> [global\_additional\_tag](#input\_global\_additional\_tag) | Additional tags for all resources. | `map(string)` | `{}` | no |
| <a name="input_iam_policies"></a> [iam\_policies](#input\_iam\_policies) | The list of iam policy | <pre>list(object({<br>    identifier              = string<br>    policy_json             = string<br>    name_tag_postfix        = string<br>    additional_tag          = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_name_tag_convention"></a> [name\_tag\_convention](#input\_name\_tag\_convention) | The name tag convention of all resources. | <pre>object({<br>    project_name   = string<br>    stage          = string<br>  })</pre> | <pre>{<br>  "project_name": "tf",<br>  "stage": "poc"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_profile_arns"></a> [ec2\_profile\_arns](#output\_ec2\_profile\_arns) | The arn of ec2 profiles |

## Example
```hcl
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
```
<!-- END_TF_DOCS -->