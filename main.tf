resource "aws_s3_bucket" "terraformstaticbucket" {
  bucket = "terraformstatic256"
}

resource "aws_s3_bucket_ownership_controls" "terraformstaticbucket" {
  bucket = aws_s3_bucket.terraformstaticbucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "terraformstaticbucket" {
  bucket = aws_s3_bucket.terraformstaticbucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "terraformstaticbucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.terraformstaticbucket,
    aws_s3_bucket_public_access_block.terraformstaticbucket,
  ]

  bucket = aws_s3_bucket.terraformstaticbucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "terraformstaticbucket" {
  bucket = aws_s3_bucket.terraformstaticbucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.terraformstaticbucket.id
  key    = "index.html"
  source = "WebFiles/index.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.terraformstaticbucket.id
  key    = "error.html"
  source = "WebFiles/error.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "meow" {
  bucket = aws_s3_bucket.terraformstaticbucket.id
  key    = "meow.jpg"
  source = "WebFiles/meow.jpg"
  acl = "public-read"
}
