// The registry we're going to put our containers in.
resource "dockerhub_repository" "hello-go" {
  name             = "hello-go"
  namespace        = var.dockerhub_username
  description      = "Containers for the hello-go project."
  full_description = "Containers for the hello-go project."
}

// Generate a token for the GitHub Action.
resource "dockerhub_token" "github_token" {
  label = "github_token"
  scopes = ["repo:admin"]
}