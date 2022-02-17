# Enter credentials here, then issue "source credentials.sh" before using Terraform
export DOCKER_USERNAME=awamob
# We need the username once for the Terraform provider and then as variable itself.
export TF_VAR_dockerhub_username="$DOCKER_USERNAME"
export DOCKER_PASSWORD=<YOUR DOCKERHUB LOGIN PW>
export GITHUB_OWNER=borismw
export TF_VAR_github_owner="$GITHUB_OWNER"
export GITHUB_TOKEN=<GITHUB PA TOKEN>
export TF_VAR_github_token="$GITHUB_TOKEN"

