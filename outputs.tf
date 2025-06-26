output "web_server_public_ip" {
  value = google_compute_instance.web_server.network_interface[0].access_config[0].nat_ip
}
output "web_server_public_dns" {
  value = google_compute_instance.web_server.network_interface[0].access_config[0].nat_ip
}
output "web_server_name" {
  value = google_compute_instance.web_server.name
}