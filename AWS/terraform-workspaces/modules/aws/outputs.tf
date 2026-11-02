output "vm_ids" {
  value = aws_instance.vm[*].id
}

output "bucket_names" {
  value = aws_s3_bucket.bucket[*].bucket
}
 
output "vpc_id" {
  value = aws_vpc.vpc
}

output "subnet_az" {
  value = aws_subnet.subnet.availability_zone
}