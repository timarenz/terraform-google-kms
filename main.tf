resource "google_project_service" "main" {
  project            = var.project
  service            = "cloudkms.googleapis.com"
  disable_on_destroy = var.disable_kms_api_on_destroy
}

resource "google_service_account" "main" {
  account_id   = "${var.environment_name}-${var.name}"
  display_name = "${var.environment_name}-${var.name}"
  project      = var.project
}

resource "google_service_account_key" "main" {
  service_account_id = google_service_account.main.name
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
}

resource "random_string" "kms_key_ring" {
  length  = 4
  special = false
  upper   = false
}

resource "google_kms_key_ring" "main" {
  depends_on = [google_project_service.main]
  project    = var.project
  name       = "${var.environment_name}-${var.name}-${random_string.kms_key_ring.result}"
  location   = var.location
}

resource "google_kms_crypto_key" "main" {
  name            = "${var.environment_name}-${var.name}"
  key_ring        = google_kms_key_ring.main.self_link
  rotation_period = "100000s"
}

resource "google_kms_key_ring_iam_binding" "main" {
  key_ring_id = google_kms_key_ring.main.self_link
  role        = "roles/owner"

  members = [
    "serviceAccount:${google_service_account.main.email}",
  ]
}
