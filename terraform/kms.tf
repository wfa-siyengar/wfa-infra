resource "google_kms_key_ring" "default" {
  name = var.ring_name
  location = var.ring_location
}
resource "google_kms_crypto_key" "default" {
  name = "gce_east1_symm_key"
  key_ring = google_kms_key_ring.default.self_link
}
data "google_iam_policy" "default" {
  binding {
    members = [
      "serviceAccount:service-1049178966878@compute-system.iam.gserviceaccount.com"
    ]
    role = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  }
}
