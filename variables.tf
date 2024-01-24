variable "tfcloud_token_token" {
  type        = string
  description = "The token string you were given by terraform cloud"
  sensitive   = true
}
variable "tfcloud_organization_email" {
  description = "Admin email address"
  default     = "example@gmail.com"
  type        = string
}
variable "tfcloud_organization_name" {
  default     = "example-organization-managed-terraform"
  description = "Name of the organization."
  type        = string
}
variable "tfcloud_workspace_name" {
  default     = "example-workspace-managed-terraform"
  description = "Name of the workspace"
  type        = string
}
variable "tfcloud_oauth_token" {
  description = "test"
  type        = string
  default     = "The token string you were given by your VCS provider, e.g. ghp_xxxxxxxxxxxxxxx for a GitHub personal access token."
  sensitive   = true
}
variable "service_provider_api" {
  default     = "https://api.github.com"
  type        = string
  description = "The base URL of your VCS provider's API (e.g. https://api.github.com or https://ghe.example.com/api/v3)."
}
variable "service_provider_name" {
  default     = "github"
  type        = string
  description = "The VCS provider being connected with. Valid options are ado_server, ado_services, bitbucket_hosted, bitbucket_server, github, github_enterprise, gitlab_hosted, gitlab_community_edition, or gitlab_enterprise_edition."
}
variable "service_provider_url" {
  default     = "https://github.com"
  type        = string
  description = "The homepage of your VCS provider (e.g. https://github.com or https://ghe.example.com)."
}
variable "tfcloud_project_nmae" {
  default     = "example-project-managed-terraform"
  type        = string
  description = "Name of terraform cloud project"
}
variable "execution_mode" {
  default     = "remote"
  type        = string
  description = "Which execution mode to use as the default for all workspaces in the organization. Valid values are remote, local oragent"
}
variable "global_remote_state_enabled" {
  default     = true
  type        = bool
  description = "Indicated of restriction to tfstate file"
}
variable "remote_state_consumer_list" {
  type        = list(string)
  description = "List of workspace id to allow use tfstate file"
  default     = []
}
variable "vcs_repo_name" {
  type        = string
  description = "Repository name where contains terraform code for deploy (e.g. repo/production)"
}
variable "vcs_repo_branch" {
  type        = string
  default     = "main"
  description = "Repository branch name where contains terraform code for deploy"
}
variable "terraform_version" {
  type        = string
  default     = "~> 1.6.0"
  description = " The version of Terraform to use for this workspace. This can be either an exact version or a version constraint (like ~> 1.0.0)"
}
variable "working_directory" {
  type        = string
  default     = ""
  description = "A relative path that Terraform will execute within. Defaults to the root of your repository."
}