terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }


 backend "s3" {
    bucket = "uppala-84s-remote-dev"
    key    = "roboshop-dev-vpc"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}


#Configure the AWS Provider
provider "aws" {
 #configuration options
 region = "us-east-1"
}