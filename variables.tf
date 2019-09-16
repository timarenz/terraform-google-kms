variable "name" {
  type = string
}

variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "disable_kms_api_on_destroy" {
  type    = bool
  default = false
}

