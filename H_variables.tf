variable "aws_region" {
  description = "The AWS region to deploy resources."
  default     = "us-west-2"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances."
  default     = "ami-0abcdef1234567890"
}

variable "instance_type" {
  description = "The instance type for the EC2 instances."
  default     = "r5.large"
}

variable "key_name" {
  description = "The key name for SSH access."
  default     = "my-key"
}
variable "db_host" {
  description = "The database host for the SQL Server database."
}

variable "db_username" {
  description = "The database username for the SQL Server database."
}

variable "db_password" {
  description = "The database password for the SQL Server database."
}
