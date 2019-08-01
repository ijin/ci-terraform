provider "aws" {
  region     = "ap-northeast-1"
  version    = "~> 1.60.0"
  allowed_account_ids = ["${var.account_id}"]
}

terraform {
  backend "s3" {
    bucket = "cs-tf"
    key    = "ci.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "common" {
  backend = "s3"
  config {
    bucket = "cs-tf"
    key    = "common.tfstate"
    region = "ap-northeast-1"
  }
}

