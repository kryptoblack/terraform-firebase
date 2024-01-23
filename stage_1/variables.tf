variable "gcp_project_name" {
  type        = string
  description = "The project name"
  default     = "survey-sync"
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
