variable "aws_region" {
  type    = "string"
  default = "ap-southeast-1"
}

variable "s3_bucket_name" {
  type    = "string"
  default = "terraform-eksworkshop-states"
}

variable "dynamodb_table_name" {
  type    = "string"
  default = "terraform-eksworkshop-states-lock"
}
