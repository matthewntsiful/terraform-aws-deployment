# Create S3 buckets for remote state storage
resource "aws_s3_bucket" "state_bucket" {
  for_each = toset(["dev", "staging", "prod"])
  
  bucket = "deployments-${each.value}-state"
  
  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
}

# Enable versioning on all buckets
resource "aws_s3_bucket_versioning" "state_bucket_versioning" {
  for_each = aws_s3_bucket.state_bucket
  
  bucket = each.value.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "state_bucket_encryption" {
  for_each = aws_s3_bucket.state_bucket
  
  bucket = each.value.id
  
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block public access to the state buckets
resource "aws_s3_bucket_public_access_block" "state_bucket_access" {
  for_each = aws_s3_bucket.state_bucket
  
  bucket = each.value.id
  
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Create DynamoDB tables for state locking
resource "aws_dynamodb_table" "state_locks" {
  for_each = toset(["dev", "staging", "prod"])
  
  name         = "deployments-${each.value}-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
  
  # Prevent accidental deletion of this DynamoDB table
  lifecycle {
    prevent_destroy = true
  }
  
  tags = {
    Name        = "tf-state-lock-${each.value}"
    Environment = each.value
    ManagedBy   = "terraform"
  }
}

# Output the S3 bucket names
output "state_bucket_names" {
  description = "Map of environment to S3 bucket names"
  value = {
    for env, bucket in aws_s3_bucket.state_bucket : env => bucket.id
  }
}

# Output the DynamoDB table names
output "lock_table_names" {
  description = "Map of environment to DynamoDB table names"
  value = {
    for env, table in aws_dynamodb_table.state_locks : env => table.name
  }
}
