output "printing_instance_ip" {
  value       = aws_instance.trial.public_ip
  description = "Public Instance IP"
}