provider "google" {
  project = var.project_id
}

module "virtual_machine" {
  source = "../../modules/virtual_machine"

  # Environmental variables
  project_id = var.project_id
  region = var.region
  zone = var.zone
  vm_network_name = var.vm_network_name
  vm_name = var.vm_name

  providers = {
    google = google
  }
}
