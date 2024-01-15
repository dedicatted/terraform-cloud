module "cloud_init" {
  source                      = "github.com/dedicatted/terraform-cloud"
  tfcloud_token_token         = "terraform_cloud_token"
  tfcloud_oauth_token         = "git_hub_token"
  vcs_repo_name               = "organization_name/repo_name"
  global_remote_state_enabled = true # indicate restriction of use state file from another workspace. If this parameters false, you should specify next parameters.
  remote_state_consumer_list  = ["ws-oAERvgW6XJSZa22t"]
  working_directory           = "example"
}