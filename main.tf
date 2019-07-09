variable "account_id" {}
variable "app" {}
variable "s3" { type = "map" }

locals {
  ssm = "/${var.app}/${terraform.workspace}"
}

resource "aws_ecr_repository" "ci-tf" {
  name = "ci-tf-${terraform.workspace}"
}
