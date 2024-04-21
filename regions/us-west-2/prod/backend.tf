terraform {
  backend "s3" {
    bucket         = "my-terraform-states"
    key            = "${var.environment}/terraform.tfstate"
    region         = "${var.region}"
    dynamodb_table = "my-lock-table"
    encrypt        = true
  }
}