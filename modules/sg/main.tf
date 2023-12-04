variable "name" {
  description = "Name of the security group"
}

variable "description" {
  description = "Description of the security group"
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "List of egress rules for the security group"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

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