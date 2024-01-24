resource "tfe_organization" "tfcloud_organization" {
  name  = var.tfcloud_organization_name
  email = var.tfcloud_organization_email
}
resource "tfe_organization_default_settings" "org_default" {
  organization           = tfe_organization.tfcloud_organization.name
  default_execution_mode = var.execution_mode
}

resource "tfe_oauth_client" "tfcloud_oauth_client" {
  depends_on       = [tfe_organization.tfcloud_organization]
  organization     = tfe_organization.tfcloud_organization.id
  api_url          = var.service_provider_api
  http_url         = var.service_provider_url
  oauth_token      = var.tfcloud_oauth_token
  service_provider = var.service_provider_name
}

resource "tfe_project" "project" {
  organization = tfe_organization.tfcloud_organization.name
  name         = var.tfcloud_project_nmae
}

resource "tfe_workspace" "tfcloud_workspace" {
  name                = var.tfcloud_workspace_name
  organization        = tfe_organization.tfcloud_organization.id
  queue_all_runs      = false
  global_remote_state = (length(var.remote_state_consumer_list) == 0 && var.global_remote_state_enabled) ? true : false
  remote_state_consumer_ids = var.remote_state_consumer_list
  terraform_version   = var.terraform_version
  project_id          = tfe_project.project.id
  working_directory   = var.working_directory
  vcs_repo {
    branch         = var.vcs_repo_branch
    identifier     = var.vcs_repo_name
    oauth_token_id = tfe_oauth_client.tfcloud_oauth_client.oauth_token_id
  }
}