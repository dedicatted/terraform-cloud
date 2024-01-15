# Terraform Cloud Init configuration

This is a terraform module which create initialization configuration for [Terraform Cloud](https://developer.hashicorp.com/terraform/cloud-docs).

## What will this do?

This is a Terraform configuration that will created organization, workspace, connect with VCS repository, project in terraform cloud.

Terraform cloud have free tier - 500 resource per month. The next resorces over free tier limits cost $0.00014 per hour per resource.

## Usage
```hcl
//Configuration to call the module
module "eks-addons" {
  source                      = "github.com/dedicatted/terraform-aws-eks-addons"
  tfcloud_token_token         = "terraform_cloud_token"
  tfcloud_oauth_token         = "git_hub_token"
  vcs_repo_name               = "organization_name/repo_name"
  global_remote_state_enabled = true # indicate restriction of use state file from another workspace. If this parameters false, you should specify next parameters.
  remote_state_consumer_list  = ["ws-oAERvgW6XJSZa22t"]
  working_directory           = "example"
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.51.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | ~> 0.51.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_oauth_client.tfcloud_oauth_client](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/oauth_client) | resource |
| [tfe_organization.tfcloud_organization](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/organization) | resource |
| [tfe_organization_default_settings.org_default](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/organization_default_settings) | resource |
| [tfe_project.project](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) | resource |
| [tfe_workspace.tfcloud_workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace.tfcloud_workspace_with_stricted_tfstate](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_execution_mode"></a> [execution\_mode](#input\_execution\_mode) | Which execution mode to use as the default for all workspaces in the organization. Valid values are remote, local oragent | `string` | `"remote"` | no |
| <a name="input_global_remote_state_enabled"></a> [global\_remote\_state\_enabled](#input\_global\_remote\_state\_enabled) | Indicated of restriction to tfstate file | `bool` | `true` | no |
| <a name="input_remote_state_consumer_list"></a> [remote\_state\_consumer\_list](#input\_remote\_state\_consumer\_list) | List of workspace id to allow use tfstate file | `list(string)` | <pre>[]</pre> | no |
| <a name="input_service_provider_api"></a> [service\_provider\_api](#input\_service\_provider\_api) | The base URL of your VCS provider's API (e.g. https://api.github.com or https://ghe.example.com/api/v3). | `string` | `"https://api.github.com"` | no |
| <a name="input_service_provider_name"></a> [service\_provider\_name](#input\_service\_provider\_name) | The VCS provider being connected with. Valid options are ado\_server, ado\_services, bitbucket\_hosted, bitbucket\_server, github, github\_enterprise, gitlab\_hosted, gitlab\_community\_edition, or gitlab\_enterprise\_edition. | `string` | `"github"` | no |
| <a name="input_service_provider_url"></a> [service\_provider\_url](#input\_service\_provider\_url) | The homepage of your VCS provider (e.g. https://github.com or https://ghe.example.com). | `string` | `"https://github.com"` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | The version of Terraform to use for this workspace. This can be either an exact version or a version constraint (like ~> 1.0.0) | `string` | `"~> 1.6.0"` | no |
| <a name="input_tfcloud_oauth_token"></a> [tfcloud\_oauth\_token](#input\_tfcloud\_oauth\_token) | test | `string` | `"The token string you were given by your VCS provider, e.g. ghp_xxxxxxxxxxxxxxx for a GitHub personal access token."` | no |
| <a name="input_tfcloud_organization_email"></a> [tfcloud\_organization\_email](#input\_tfcloud\_organization\_email) | Admin email address | `string` | `"example@gmail.com"` | no |
| <a name="input_tfcloud_organization_name"></a> [tfcloud\_organization\_name](#input\_tfcloud\_organization\_name) | Name of the organization. | `string` | `"example-organization-managed-terraform"` | no |
| <a name="input_tfcloud_project_nmae"></a> [tfcloud\_project\_nmae](#input\_tfcloud\_project\_nmae) | Name of terraform cloud project | `string` | `"example-project-managed-terraform"` | no |
| <a name="input_tfcloud_token_token"></a> [tfcloud\_token\_token](#input\_tfcloud\_token\_token) | The token string you were given by terraform cloud | `string` | n/a | yes |
| <a name="input_tfcloud_workspace_name"></a> [tfcloud\_workspace\_name](#input\_tfcloud\_workspace\_name) | Name of the workspace | `string` | `"example-workspace-managed-terraform"` | no |
| <a name="input_vcs_repo_branch"></a> [vcs\_repo\_branch](#input\_vcs\_repo\_branch) | Repository branch name where contains terraform code for deploy | `string` | `"main"` | no |
| <a name="input_vcs_repo_name"></a> [vcs\_repo\_name](#input\_vcs\_repo\_name) | Repository name where contains terraform code for deploy (e.g. repo/production) | `string` | n/a | yes |
| <a name="input_working_directory"></a> [working\_directory](#input\_working\_directory) | A relative path that Terraform will execute within. Defaults to the root of your repository. | `string` | `""` | no |

## Outputs

No outputs.
