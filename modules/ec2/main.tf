resource "aws_instance" "example_instance" {
  count = 2  # Set the count to 2 to create two instances

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

output "instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = aws_instance.example_instance[*].id
}

output "public_ips" {
  description = "Public IP addresses of the created EC2 instances"
  value       = aws_instance.example_instance[*].public_ip
}