resource "aws_dynamodb_table" "this" {
  name         = "${var.name_prefix}-${var.table_name}"
  billing_mode = var.billing_mode
  hash_key     = var.hash_key

  read_capacity  = var.billing_mode == "PROVISIONED" ? var.read_capacity : null
  write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity : null

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }

  dynamic "attribute" {
    for_each = var.range_key != "" ? [var.range_key] : []
    content {
      name = attribute.value
      type = var.range_key_type
    }
  }

  range_key = var.range_key != "" ? var.range_key : null

  dynamic "ttl" {
    for_each = var.enable_ttl ? [1] : []
    content {
      attribute_name = var.ttl_attribute
      enabled        = true
    }
  }

  point_in_time_recovery {
    enabled = var.point_in_time_recovery
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-${var.table_name}"
    }
  )
}
