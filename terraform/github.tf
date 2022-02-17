// The actual repository with the source code.
resource "github_repository" "hello_go" {
  name        = "hello-go"
  description = "Repository for the hello-go api."

  has_issues    = false
  has_downloads = false
  has_wiki      = false
  has_projects  = false
}

// Add the token for pushing to DockerHub as a secret here
resource "github_actions_secret" "dockerhub_token" {
  repository      = github_repository.hello_go.name
  secret_name     = "DOCKERHUB_TOKEN"
  plaintext_value = dockerhub_token.github_token.token
}

// Same with username. Could be clear-text, but if parameterizable you can try it out yourself
// with your DockerHub login as well.
resource "github_actions_secret" "dockerhub_username" {
  repository      = github_repository.hello_go.name
  secret_name     = "DOCKERHUB_USERNAME"
  plaintext_value = var.dockerhub_username
}

// Get this very hello-infra as data source. It's difficult to provision this as resource, because
// this leads to a difficult hen-egg-question.
data "github_repository" "hello_infra" {
  full_name = "${var.github_owner}/hello-infra"
}

// Provide GitHub token for the action to run in here.
resource "github_actions_secret" "github_token_in_hello_go" {
  repository      = github_repository.hello_go.name
  secret_name     = "GH_TOKEN"
  plaintext_value = var.github_token
}

// ... as well as in the infra repository.
resource "github_actions_secret" "github_token_in_hello_infra" {
  repository      = data.github_repository.hello_infra.name
  secret_name     = "GH_TOKEN"
  plaintext_value = var.github_token
}
