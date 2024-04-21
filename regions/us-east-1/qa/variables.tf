variable "region" {
  type = string
}
variable "vpc_cidr" {}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "security_groups" {
  description = "Map of security group configurations"
  type        = map(object({
    ingress = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
  default = {
    "sg-example-1" = {
      ingress = [
        {
          description = "SSH"
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
      egress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
  }
}

variable "instance_type" {}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable environment {
  type = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "Map containing versioning configuration."
  type        = map(string)
  default     = {
    enabled = "true"
    }
}

variable "block_public_access" {
  description = "Block public access settings for the S3 bucket"
  type        = map(bool)
  default = {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
}

variable "lambda_function_name" {}

variable "lambda_handler" {}

variable "runtime" {}

variable "lambda_zip_path" {
  description = "Path to the ZIP file containing the Lambda function code"
  type        = string
}