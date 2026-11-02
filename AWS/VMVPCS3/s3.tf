resource "aws_s3_bucket" "s3" {
  count = var.bucket_count
  bucket = "${var.bucket}-${count.index + 1}"
}