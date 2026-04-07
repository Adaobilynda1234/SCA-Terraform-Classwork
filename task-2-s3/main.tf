provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "backup" {
  bucket = "ada-terraform-backup-12345" # MUST be unique

  tags = {
    Name  = "app-backup-bucket"
    Owner = "Adaobi"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.backup.id

  versioning_configuration {
    status = "Enabled"
  }
}