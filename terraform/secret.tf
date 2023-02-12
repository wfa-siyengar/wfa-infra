resource "google_container_cluster" "mycluster" {
   project = "my-project-test-373810"
   name = "mycluster"
   zone = "europe-west3-a"
   initial_node_count = 1

   node_version = "${var.node_version}"
   min_master_version = "${var.node_version}"
   node_config {
       machine_type = "g1-small"
       disk_size_gb = 50
   }
}


 provider "kubernetes" {
   host     = "${google_container_cluster.mycluster.endpoint}"

   client_certificate     = "${base64decode(google_container_cluster.primary.master_auth.0.client_certificate)}"
   client_key             = "${base64decode(google_container_cluster.primary.master_auth.0.client_key)}"
   cluster_ca_certificate = "${base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)}"
}

resource "kubernetes_secret" "cloudsql-db-credentials" {
   "metadata" {
       name = "cloudsql-db-credentials"
   }

   data {
       username = "${var.db_user}"
       password = "${var.db_password}"
   }
}

resource "kubernetes_config_map" "dbconfig" {
   "metadata" {
       name = "dbconfig"
   }

   data = {
       dbconnection = "${var.project_id}:${var.region}:${google_sql_database_instance.master.name}"
   }
}
