provider "aws" {
  region  = var.aws_region
  version = "~> 2.0"
}

resource "aws_s3_bucket" "terraform-s3-remote-states-storage" {
  bucket = var.s3_bucket_name

  versioning {
    enabled = true
  }

  tags = {
    Name    = "Terraform states storage"
    Project = "EKS Workshop"
  }
}

resource "aws_dynamodb_table" "terraform-dynamodb-states-lock" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name    = "Terraform states lock table"
    Project = "EKS Workshop"
  }
}
