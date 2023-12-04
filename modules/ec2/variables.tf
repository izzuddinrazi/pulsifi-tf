variable "instance_type" {
  description = "EC2 instance type"
}

variable "ami" {
  description = "Amazon Machine Image (AMI) ID"
}

variable "key_pair" {
  description = "Key pair name for EC2 instance"
}

variable "security_group_id" {
  description = "Security Group ID for EC2 instance"
}