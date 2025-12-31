terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.21.0"
    }
  }


  backend "s3" {
    bucket         = "practice-test-bucket-123-456"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "practice-dynamodb-table"
  }
}

