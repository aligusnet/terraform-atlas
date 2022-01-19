variable "mongodbatlas_public_key" {
  type = string
  description = "Public Programmatic API key to authenticate to Atlas"
}

variable "mongodbatlas_private_key" {
  type = string
  description = "Private Programmatic API key to authenticate to Atlas"
}

variable "mongodbatlas_org_id" {
  type = string
  description = "MongoDB Organization ID"
}
