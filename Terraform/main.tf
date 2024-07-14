provider "google" {
  project = var.project
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = 2

  node_config {
    machine_type = "e2-medium"
  }
}

resource "google_sql_database_instance" "db_instance" {
  name             = var.db_instance_name
  database_version = "POSTGRES_13"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
    deletion_protection = false
}

resource "google_sql_database" "default" {
  name     = var.db_name
  instance = google_sql_database_instance.db_instance.name
}

resource "google_sql_user" "users" {
  name     = var.db_user
  instance = google_sql_database_instance.db_instance.name
  password = var.db_password
}

output "kubernetes_cluster_name" {
  value = google_container_cluster.primary.name
}

output "sql_instance_connection_name" {
  value = google_sql_database_instance.db_instance.connection_name
}
