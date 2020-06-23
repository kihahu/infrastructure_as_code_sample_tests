provider "google" {
  spanner_custom_endpoint = "http://localhost:9020/v1/"
  project = "sam-test-id"
  access_token = "xxxxx"
}

resource "google_spanner_instance" "main" {
  config       = "regional-europe-west1"
  display_name = var.display_name
}

resource "google_spanner_database" "database" {
  instance = google_spanner_instance.main.name
  name     = var.database_name
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
    "CREATE TABLE t2 (t2 INT64 NOT NULL,) PRIMARY KEY(t2)",
  ]
}

