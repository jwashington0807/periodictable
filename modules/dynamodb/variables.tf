variable "name_prefix" {
  type        = string
  description = "Prefix for naming the DynamoDB table"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the DynamoDB table"
}

variable "table_name" {
  type        = string
  description = "Name suffix for the DynamoDB table"
}

variable "hash_key" {
  type        = string
  description = "Attribute name to use as the hash (partition) key"
}

variable "hash_key_type" {
  type        = string
  description = "Attribute type for the hash key: S (string), N (number), or B (binary)"
  default     = "S"
}

variable "range_key" {
  type        = string
  description = "Attribute name to use as the range (sort) key. Leave empty if not needed."
  default     = ""
}

variable "range_key_type" {
  type        = string
  description = "Attribute type for the range key: S (string), N (number), or B (binary)"
  default     = "S"
}

variable "billing_mode" {
  type        = string
  description = "Billing mode: PAY_PER_REQUEST or PROVISIONED"
  default     = "PAY_PER_REQUEST"
}

variable "read_capacity" {
  type        = number
  description = "Read capacity units (only used when billing_mode is PROVISIONED)"
  default     = 5
}

variable "write_capacity" {
  type        = number
  description = "Write capacity units (only used when billing_mode is PROVISIONED)"
  default     = 5
}

variable "enable_ttl" {
  type        = bool
  description = "Enable TTL on the table"
  default     = false
}

variable "ttl_attribute" {
  type        = string
  description = "Attribute name for TTL (required if enable_ttl is true)"
  default     = "ttl"
}

variable "point_in_time_recovery" {
  type        = bool
  description = "Enable point-in-time recovery"
  default     = true
}
