resource "google_compute_network" "default" {
  name         = var.vm_network_name
  routing_mode = "REGIONAL"
  project      = var.project_id
}

resource "google_compute_firewall" "allow_iap_tunnel" {
  name        = "allow-iap-tunnel"
  network     = google_compute_network.default.name
  target_tags = ["http-tag"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]
}

resource "google_compute_disk" "persistent_disk" {
  name = "${var.vm_name}-pd-disk"
  type = "pd-standard"
  zone = var.zone
  size = "200"
}

resource "google_compute_instance" "e2edf_vm" {
  name                      = var.vm_name
  project                   = var.project_id
  machine_type              = "n2-standard-8"
  zone                      = var.zone
  allow_stopping_for_update = "true"

  tags = ["http-tag"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  attached_disk {
    source      = google_compute_disk.persistent_disk.id
    device_name = google_compute_disk.persistent_disk.name
  }

  network_interface {
    network = google_compute_network.default.name
  }
}

resource "google_compute_router" "nat_router_europe_west4" {
  name    = "nat-router-${var.region}"
  region  = var.region
  network = google_compute_network.default.name
}

resource "google_compute_router_nat" "nat_config" {
  name                               = "nat-config-${var.region}"
  router                             = google_compute_router.nat_router_europe_west4.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
