resource "google_project_service" "main" {
  project            = var.project
  service            = "cloudkms.googleapis.com"
  disable_on_destroy = var.disable_kms_api_on_destroy
}

resource "google_kms_key_ring" "main" {
  depends_on = [google_project_service.main]
  project    = var.project
  name       = var.name
  location   = var.region
}

resource "google_kms_crypto_key" "main" {
  name            = var.name
  key_ring        = google_kms_key_ring.main.self_link
  rotation_period = "100000s"
}
