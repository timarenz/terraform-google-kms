output "service_accout_id" {
  value = google_service_account.main.unique_id
}

output "service_accout_name" {
  value = google_service_account.main.name
}

output "service_accout_email" {
  value = google_service_account.main.email
}

output "key_ring_self_link" {
  value = google_kms_key_ring.main.self_link
}

output "key_ring" {
  value = google_kms_key_ring.main.name
}

output "crypto_key_self_link" {
  value = google_kms_crypto_key.main.self_link
}

output "crypto_key_id" {
  value = google_kms_crypto_key.main.id
}

output "crypto_key" {
  value = google_kms_crypto_key.main.name
}

output "google_credentials_file" {
  value = base64decode(google_service_account_key.main.private_key)
}

output "region" {
  value = var.location
}
