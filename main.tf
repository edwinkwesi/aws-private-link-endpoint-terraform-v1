#Configure AWS provider
provider "aws" {
  region                   = "eu-west-2"
  shared_credentials_files = ["~/.aws/credentials"]
  #   profile = 339713089708

}

terraform {
  backend "s3" {
    bucket                  = "tf-statfile"
    key                     = ".terraform/terraform.tfstate"
    region                  = "eu-west-2"
    shared_credentials_file = "~/.aws/credentials"
  }
}
