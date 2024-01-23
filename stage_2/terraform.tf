terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.10"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

# Configures the provider to use the resource block's specified project for quota checks.
provider "google-beta" {
  region                = data.terraform_remote_state.stage_1.outputs.google_region
  zone                  = data.terraform_remote_state.stage_1.outputs.google_zone
  user_project_override = true
}
