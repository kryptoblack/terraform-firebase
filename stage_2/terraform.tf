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
  region                = data.terraform_remote_state.stage_1.outputs.gcp_region
  zone                  = data.terraform_remote_state.stage_1.outputs.gcp_zone
  user_project_override = true
}

# Configures the provider to not use the resource block's specified project for quota checks.
# This provider should only be used during project creation and initializing services.
provider "google-beta" {
  region                = data.terraform_remote_state.stage_1.outputs.gcp_region
  zone                  = data.terraform_remote_state.stage_1.outputs.gcp_zone
  alias                 = "no_user_project_override"
  user_project_override = false
}

provider "random" {}
