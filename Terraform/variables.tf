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
  default     = "my-sql-instance"
}

variable "db_name" {
  description = "The name of the database"
  default     = "mydatabase"
}

variable "db_user" {
  description = "The database user"
  default     = "dbuser"
}

variable "db_password" {
  description = "The database password"
}
