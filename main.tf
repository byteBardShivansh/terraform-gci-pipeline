provider "google" {
  project = var.project_id
  region  = "us-central1"
}

data "google_compute_image" "ubuntu" {
  most_recent = true

  family = "ubuntu-2004-lts"

  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "web_server" {
  name         = "web-server"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }

  network_interface {
    network = "default"
    access_config {
      // This is the equivalent of associate_public_ip_address = true in AWS
    }
  }

  tags = ["web-server"]
}