variable "project" {
  description = "The GCP project ID"
}

variable "region" {
  description = "The GCP region"
  default     = "us-central1"
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  default     = "my-gke-cluster"
}

variable "db_instance_name" {
  description = "The name of the Cloud SQL instance"
  default     = "sql-instance"
}

variable "db_name" {
  description = "The name of the database"
  default     = "test-db"
}

variable "db_user" {
  description = "The database user"
  default     = "userdb"
}

variable "db_password" {
  description = "password"
}
