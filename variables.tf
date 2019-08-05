variable "environment_name" {
  type = string
}

variable "name" {
  type = string
}

variable "project" {
  type = string
}

variable "location" {
  type    = string
  default = "europe-west4"
}

variable "disable_kms_api_on_destroy" {
  type    = bool
  default = false
}

