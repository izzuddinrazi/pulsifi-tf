resource "aws_security_group" "example_sg" {
  name        = var.name
  description = var.description

  ingress = var.ingress_rules
  egress  = var.egress_rules
}

output "security_group_id" {
  description = "ID of the created security group"
  value       = aws_security_group.example_sg.id
}