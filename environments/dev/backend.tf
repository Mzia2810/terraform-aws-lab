terraform {
  backend "s3" {
    bucket = "s3-terraform-state-buck"
    key    = "dev/vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}
