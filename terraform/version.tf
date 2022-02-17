terraform {
  required_providers {
    dockerhub = {
      source = "BarnabyShearer/dockerhub"
      version = "~>0.0.8"
    }
    github = {
      source = "integrations/github"
      version = "~>4.20.0"
    }
  }
}