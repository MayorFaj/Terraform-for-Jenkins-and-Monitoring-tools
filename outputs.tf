output "CGR-Jenkins-Ip" {
  description = "Public DNS of Jenkins server"
  value       = aws_instance.Jenkins-server.public_ip
}

output "CGR-Prometheus-Ip" {
  description = "Public DNS of Prometheus-Grafana server"
  value       = aws_instance.Prometheus-Grafana-Server.public_ip
}