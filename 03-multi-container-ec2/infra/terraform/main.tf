# Latest Amazon Linux 2023 AMI
data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

# SSH key: generated here, public half uploaded to AWS, private half saved for Ansible
resource "tls_private_key" "ssh" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "key" {
  key_name   = "flask-mysql-key"
  public_key = tls_private_key.ssh.public_key_openssh
}

resource "local_sensitive_file" "private_key" {
  content         = tls_private_key.ssh.private_key_openssh
  filename        = "${path.module}/../keys/flask-mysql-key.pem"
  file_permission = "0400"
}

# Firewall: SSH and the app, only from my IP. MySQL (3306) stays closed.
resource "aws_security_group" "app" {
  name = "flask-mysql-sg"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "Flask app"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami                    = data.aws_ssm_parameter.ami.insecure_value
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.app.id]

  tags = {
    Name = "flask-mysql-compose"
  }
}

# Write the Ansible inventory with the new IP
resource "local_file" "inventory" {
  filename = "${path.module}/../ansible/inventory.ini"
  content  = <<-EOT
    [app]
    ${aws_instance.app.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=../keys/flask-mysql-key.pem
  EOT
}
