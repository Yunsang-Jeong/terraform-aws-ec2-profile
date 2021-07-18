##################################################
# Shared
variable "name_tag_convention" {
  description = "The name tag convention of all resources."
  type = object({
    project_name   = string
    stage          = string
  })
  default = {
    project_name = "tf"
    stage        = "poc"
  }
}

variable "global_additional_tag" {
  description = "Additional tags for all resources."
  type        = map(string)
  default     = {}
}
##################################################


##################################################
# IAM Policy
variable "iam_policies" {
  description = "The list of iam policy"
  type = list(object({
    identifier              = string
    policy_json             = string
    name_tag_postfix        = string
    additional_tag          = optional(map(string))
  }))
  default = []
}
##################################################


##################################################
# EC2 Profile
variable "ec2_profiles" {
  description = "The list of ec2 profiles"
  type = list(object({
    identifier       = string
    name_tag_postfix = string
    additional_tag   = optional(map(string))
  }))
  default = []
}
##################################################


##################################################
# Attachment
variable "attach_user_policies" {
  description = "The attachment of iam policies created by user"
  type = list(object({
    profile_identifier = string
    policy_identifier  = string
  }))
  default = []
}

variable "attach_managed_policy" {
  description = "The attachment of iam policies created by aws"
  type = list(object({
    profile_identifier = string
    managed_policy_arn = string
  }))
  default = []
}
##################################################