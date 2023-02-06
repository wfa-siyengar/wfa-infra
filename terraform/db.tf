resource "google_spanner_instance" "main" {
  config       = "regional-us-central1"
  display_name = "kingdom_spanner"
  num_nodes    = 1
}

resource "google_spanner_database" "database" {
  instance = google_spanner_instance.main.name
  name     = "kingdom_database"
  version_retention_period = "3d"
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
    "CREATE TABLE t2 (t2 INT64 NOT NULL,) PRIMARY KEY(t2)",
  ]
  deletion_protection = false
}