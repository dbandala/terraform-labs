terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_dynamodb_table" "state-locking" {
  name         = "state-locking-table"
  billing_mode = "PAY_PER_REQUEST"

    attribute {
        name = "LockID"
        type = "S"
    }

  tags = {
    Name        = "My DynamoDB Table"
    Environment = "Dev"
  }
}