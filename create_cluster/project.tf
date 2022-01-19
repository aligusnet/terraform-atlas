resource "mongodbatlas_project" "terraform" {
    name = "Terraform"
    org_id = var.mongodbatlas_org_id
}

output "project-id" {
    value = mongodbatlas_project.terraform.id
}
