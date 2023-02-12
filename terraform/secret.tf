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
