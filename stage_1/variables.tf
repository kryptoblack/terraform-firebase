variable "gcp_project_name" {
  type        = string
  description = "The project name"
  default     = "survey-sync-929"
}

variable "gcp_region" {
  type        = string
  description = "The GCP region to deploy to"
  default     = "europe-west3"
}

variable "gcp_zone" {
  type        = string
  description = "The GCP zone to deploy to"
  default     = "europe-west3-a"
}
