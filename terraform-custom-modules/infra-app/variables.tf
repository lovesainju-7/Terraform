variable "env" {
  description = "This is the environment name for custom module usage"
  type        = string
}

variable "bucket-name" {
  description = "This is the bucket name for custom module usage"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
}

variable "instance_type" {
  description = "Types of instance"
  type        = string
}

variable "hash_key" {
  description = "The hash key for the DynamoDB table"
  type        = string
}

