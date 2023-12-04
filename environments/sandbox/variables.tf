provider "aws" {
  region = "us-west-2"  # Replace with your desired region
  # Add any other provider configurations here
}

terraform {
  backend "s3" {
    bucket         = "your-tf-state-bucket"
    key            = "sandbox/terraform.tfstate"  # Replace with the appropriate key for each environment
    region         = "us-west-2"  # Replace with your desired region
  }
}

module "ec2_example" {
  source = "../modules/ec2"

  instance_type      = "t2.micro"
  ami                = "ami-xxxxxxxxxxxxxxxxx"
  key_pair           = "your-key-pair"
  security_group_id  = "sg-xxxxxxxxxxxxxxxxx"  # Replace with your security group ID
}

module "sg_example" {
  source = "../modules/sg"

  name           = "example-security-group"
  description    = "Example security group"
  ingress_rules  = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    # Add more ingress rules as needed
  ]
  egress_rules   = [
    # Add egress rules as needed
  ]
}

module "s3_example" {
  source = "../modules/s3"

  bucket_name = "example-s3-bucket"
  # Add any other S3 module configurations as needed
}

output "ec2_instance_id" {
  description = "ID of the created EC2 instance"
  value       = module.ec2_example.instance_id
}

output "ec2_public_ip" {
  description = "Public IP address of the created EC2 instance"
  value       = module.ec2_example.public_ip
}

output "sg_id" {
  description = "ID of the created security group"
  value       = module.sg_example.security_group_id
}

output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = module.s3_example.bucket_name
}
