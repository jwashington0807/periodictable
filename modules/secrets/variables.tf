# Generic Variables
variable environment {
  type        = string
  default     = "dev"
  description = "Stage of the environment (dev, staging, prod)"
}

variable domainname {
  type        = string
  default     = "Domain Name of the website"
}

variable projectname {
  type        = string
  default     = "Name of the project"
}

# Module Variables
variable db_username {
  type        = string
  default     = ""
  description = "Database Username"
}