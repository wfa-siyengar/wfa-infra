
/*
  This is a terraform provider that will tie the terraform with the GCP account that we have.
  The JSON mentioned here should never be pushed with the code.
*/
provider "google" {
  version = "4.50.0"
  credentials = data.template_file.connection.rendered
}

terraform {
  backend "gcs" {
  }
}



