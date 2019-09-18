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

output "region" {
  value = var.region
}
