module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 3.0"
  project_id    = "my-project-test-373810"
  prefix        = "test-sa"
  names         = ["first", "second"]
}
