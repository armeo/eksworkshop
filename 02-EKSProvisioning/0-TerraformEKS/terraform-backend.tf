terraform {
  backend "s3" {
    bucket         = "terraform-eksworkshop-states"
    key            = "eks/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-eksworkshop-states-lock"
    encrypt        = true
  }
}
