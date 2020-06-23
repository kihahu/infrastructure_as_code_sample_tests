resource "google_bigtable_instance" "instance" {
  name = "bt-instance"
  cluster {
    cluster_id   = "bt-instance"
    zone         = "us-central1-b"
    num_nodes    = 3
    storage_type = "HDD"
  }

  deletion_protection  = "true"
}

resource "google_bigtable_app_profile" "ap" {
  instance       = google_bigtable_instance.instance.name
  app_profile_id = "bt-profile"

  single_cluster_routing {
    cluster_id                 = "bt-instance"
    allow_transactional_writes = true
  }

  ignore_warnings = true
}

