# Enables required APIs.
resource "google_project_service" "default" {
  provider = google-beta.no_user_project_override
  project  = google_project.default.project_id
  for_each = toset([
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "firebase.googleapis.com",

    # Enabling the ServiceUsage API allows the new project to be quota checked from now on.
    "serviceusage.googleapis.com",
  ])
  service = each.key

  # Don't disable the service if the resource block is removed by accident.
  disable_on_destroy = false
}

# Google project
resource "google_project" "default" {
  provider = google-beta.no_user_project_override

  name       = var.gcp_project_name
  project_id = var.gcp_project_name

  # Required for any service that requires the Blaze pricing plan
  # (like Firebase Authentication with GCIP)
  # billing_account = var.billing_account_id

  # Uncomment the following lines to enable Firebase for an organization
  # org_id     = var.gcp_org_id

  labels = {
    "firebase" = "enabled"
  }
}

# Firebase project
resource "google_firebase_project" "default" {
  provider = google-beta
  project  = google_project.default.project_id

  # Waits for the required APIs to be enabled.
  depends_on = [
    google_project_service.default
  ]
}

