# S3 bucket for static website hosting
resource "aws_s3_bucket" "website" {
  bucket        = "${local.bucket_name}"
}

# Make S3 bucket private
resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Origin Access Control for CloudFront (Recommended over OAI)
resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = "oac-${local.bucket_name}"
  description                       = "OAC for static website"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id

  depends_on = [aws_s3_bucket_public_access_block.website]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipal"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.website.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.s3_distribution.arn
          }
        }
      }
    ]
  })
}

# Upload website files to S3
# resource "aws_s3_object" "website_files" {
#   for_each = fileset("${path.module}/www", "**/*")

#   bucket = aws_s3_bucket.website.id
#   key    = each.value
#   source = "${path.module}/www/${each.value}"
#   etag   = filemd5("${path.module}/www/${each.value}")
#   content_type = lookup({
#     "html" = "text/html",
#     "css"  = "text/css",
#     "js"   = "application/javascript",
#     "json" = "application/json",
#     "png"  = "image/png",
#     "jpg"  = "image/jpeg",
#     "jpeg" = "image/jpeg",
#     "gif"  = "image/gif",
#     "svg"  = "image/svg+xml",
#     "ico"  = "image/x-icon",
#     "txt"  = "text/plain"
#   }, split(".", each.value)[length(split(".", each.value)) - 1], "application/octet-stream")
# }