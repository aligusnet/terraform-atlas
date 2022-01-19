locals {
    create_dedicated_cluster = true
    create_shared_cluster = true
}

resource "mongodbatlas_cluster" "dedicated" {
    count = local.create_dedicated_cluster ? 1 : 0
    project_id = mongodbatlas_project.terraform.id
    name = "dedicated"
    cluster_type = "REPLICASET"
    replication_specs {
        num_shards = 1
        regions_config {
            region_name = "US_EAST_1"
            electable_nodes = 3
            priority = 7
            read_only_nodes = 0
        }
    }

    cloud_backup = false
    auto_scaling_disk_gb_enabled = false
    mongo_db_major_version = "5.0"

    provider_name = "AWS"
    provider_instance_size_name = "M10"
    disk_size_gb = 15
}

resource "mongodbatlas_cluster" "shared" {
    count = local.create_shared_cluster ? 1 : 0
    project_id = mongodbatlas_project.terraform.id
    name = "shared"
    
    mongo_db_major_version = "5.0"
    
    provider_name = "TENANT"
    backing_provider_name = "AWS"
    provider_region_name = "US_EAST_1"
    provider_instance_size_name = "M0"
}
