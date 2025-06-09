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

resource "aws_dynamodb_table" "example" {
  name         = "my-tf-test-table"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "id"
    type = "S"
  }

  hash_key = "id"

  tags = {
    Name        = "My DynamoDB Table"
    Environment = "Dev"
  }
}

data "aws_iam_group" "finance-data" {
  group_name = "finance-analysts"
}

resource "aws_dynamodb_table_policy" "finance-policy" {
  table_name = aws_dynamodb_table.example.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          AWS = data.aws_iam_group.finance-data.arn
        }
        Action   = "dynamodb:GetItem"
        Resource = aws_dynamodb_table.example.arn
      }
    ]
  })
}
# This Terraform configuration creates a DynamoDB table and applies a policy to allow a specific IAM group to read items from the table.
# The table is set to use on-demand billing mode, and it has a single primary key attribute named "id".
# The policy grants the specified IAM group permission to perform the `dynamodb:GetItem` action on the table.
