data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-eksworkshop-states"
    key    = "vpc/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

data "template_file" "aws_ssm_setup" {
  template = file("${path.module}/templates/aws-ssm-setup.tpl")
}
