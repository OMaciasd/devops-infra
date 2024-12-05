resource "aws_s3_bucket_lifecycle_configuration" "backup_lifecycle" {
  bucket = aws_s3_bucket.backup.bucket

  rule {
    id     = "move-to-glacier"
    status = "Enabled"
    transitions {
      days          = 30
      storage_class = "GLACIER"
    }
  }
}
