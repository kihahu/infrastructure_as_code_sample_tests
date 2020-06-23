provider "google" {
  spanner_custom_endpoint = "http://localhost:9020/v1/"
  project = "sam-test-id"
  access_token = "xxxxx"
}

resource "google_spanner_instance" "main" {
  config       = "regional-europe-west1"
  display_name = "main-instance"
}

resource "google_spanner_database" "database" {
  instance = google_spanner_instance.main.name
  name     = "my-database"
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
    "CREATE TABLE t2 (t2 INT64 NOT NULL,) PRIMARY KEY(t2)",
  ]
}

