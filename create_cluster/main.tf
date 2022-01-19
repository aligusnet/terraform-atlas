terraform {
    required_providers {
        mongodbatlas = {
            source  = "mongodb/mongodbatlas"
        }
    }

    required_version = ">= 1.1.2"
}

provider "mongodbatlas" {
  public_key = var.mongodbatlas_public_key
  private_key  = var.mongodbatlas_private_key
}
