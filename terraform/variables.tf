/*

*/
locals {
  project = "wfa"
  tags = {
    Environment     = var.env
  }
  prefix      = "${var.env}-${local.project}"
  prefix_path = "${var.env}/${local.project}"
}

data external env{
  program = ["${path.module}/env.sh"]
}

data "template_file" "user_data" {
  template = file("pre_install.sh.tpl")

  vars = {
    projectName = var.projectName
  }
}

data "template_file" "connection" {
  template = file("cloud_connect.json.tpl")

  vars = {
    project = data.external.env.result["PROJECT_ID"]
    project_id = data.external.env.result["PROJECT_ID"]
    private_key_id = data.external.env.result["PRIVATE_KEY_ID"]
    private_key = data.external.env.result["PRIVATE_KEY"]
    client_email = data.external.env.result["CLIENT_EMAIL"]
    client_id = data.external.env.result["CLIENT_ID"]
    auth_uri = data.external.env.result["AUTH_URI"]
    token_uri = data.external.env.result["TOKEN_URI"]
    auth_provider_x509_cert_url = data.external.env.result["AUTH_PROVIDER_X509_CERT_URL"]
    client_x509_cert_url = data.external.env.result["CLIENT_X509_CERT_URL"]
  }
}

variable projectName {
  default = "wfa"
  description = "The IAC project of WFA "
}

variable env {
  default = "dev"
  description = "Represents the environment used."
}

variable region {
  default = "us-central1"
  description = "Represents the environment used."
}

variable project {
  default = "my-project-test-373810"
  description = "The project ID"
}