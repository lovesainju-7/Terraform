terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.21.0"
    }
  }


  #   backend "s3" {
  #     bucket         = "dev-my-terraform-bucket"
  #     key            = "terraform.tfstate"
  #     region         = "us-west-2"
  #     dynamodb_table = "dev-dynamodb-table"
  #   }
}
