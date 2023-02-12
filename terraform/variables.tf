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

data "template_file" "user_data" {
  template = file("pre_install.sh.tpl")

  vars = {
    projectName = var.projectName
  }
}

variable projectName {
  default = "wfa"
  description = "The IAC project of WFA "
}

variable node_version {
  default = "1.10.6-gke.11"
  description = "version of the GKE cluster"
}

variable min_master_version {
  default = "1.10.9-gke.5"
  description = "version of the GKE cluster"
}


variable db_user {
  default = "Admin"
  description = "DB user name"
}

variable db_password {
  default = "test"
  description = "password"
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

variable "project_id" {
  type = string
  description = "Project ID"
}
variable "zone" {
  type = string
  description = "zone for resoruces"
}
variable "ring_name" {
  type = string
  description = "KMS key ring name"
}
variable "ring_location" {
  type = string
  description = "Key ring location "
}