resource "aws_instance" "example_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_pair

  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello from user data script!"
              # Add any additional user data commands as needed
              EOF
}

output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.example_instance.id
}

output "public_ip" {
  description = "Public IP address of the created EC2 instance"
  value       = aws_instance.example_instance.public_ip
}
