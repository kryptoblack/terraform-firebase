output "gcp_project" {
  description = "Contains the GCP project Object."
  value       = google_project.default
}

output "google_firebase_project" {
  description = "Contains the Firebase project Object."
  value       = google_firebase_project.default
}

output "gcp_region" {
  description = "The GCP region to deploy to"
  value       = "europe-west3"
}

output "gcp_zone" {
  description = "The GCP zone to deploy to"
  value       = "europe-west3-a"
}
