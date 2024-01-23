data "terraform_remote_state" "stage_1" {
  backend = "local"

  config = {
    path = "../stage_1/terraform.tfstate"
  }
}

# Firebase Hosting and Web App
/*
 * resource "google_firebase_web_app" "default" {
 *   provider        = google-beta
 *   project         = data.terraform_remote_state.stage_1.outputs.google_firebase_project.project
 *   display_name    = "Admin Panel"
 *   deletion_policy = "DELETE"
 * }
 * 
 * import {
 *   provider = google-beta
 * 
 *   # Variable is used instead of remote state output because import requires 
 *   # values to resolve during plan phase.
 *   id = "projects/${var.firebase_project_id}/sites/${var.firebase_project_id}"
 *   to = google_firebase_hosting_site.default
 * }
 * 
 * resource "google_firebase_hosting_site" "default" {
 *   provider = google-beta
 *   project  = data.terraform_remote_state.stage_1.outputs.google_firebase_project.project
 *   site_id  = data.terraform_remote_state.stage_1.outputs.google_firebase_project.project
 *   app_id   = google_firebase_web_app.default.app_id
 * }
 */

# Firebase Storage
resource "google_storage_bucket" "default" {
  provider                    = google-beta
  project                     = data.terraform_remote_state.stage_1.outputs.google_project.project_id
  name                        = data.terraform_remote_state.stage_1.outputs.google_project.project_id
  location                    = "EU"
  uniform_bucket_level_access = true
  force_destroy               = true

  labels = {
    "firebase" = "enabled"
  }
}

/*
 * resource "google_firebase_storage_bucket" "default" {
 *   project   = data.terraform_remote_state.stage_1.outputs.google_firebase_project.project
 *   provider  = google-beta
 *   bucket_id = google_storage_bucket.default.id
 * }
 */
