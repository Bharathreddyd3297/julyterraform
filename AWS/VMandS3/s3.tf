resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name
  tags = {
    name = "Groww Bucket"
    owner =  "Bharath"
    environment = "Development"
  }
}