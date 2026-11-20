output "public_ip" {
  value = aws_instance.app.public_ip
}

output "ssh_command" {
  value = "ssh -i ../keys/flask-mysql-key.pem ec2-user@${aws_instance.app.public_ip}"
}

output "app_url" {
  value = "http://${aws_instance.app.public_ip}:5000"
}
