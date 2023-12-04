variable "bucket_name" {
  description = "Name of the S3 bucket"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name

  acl    = "private"
  # Add any other S3 bucket configurations as needed
}

output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.example_bucket.bucket
}
