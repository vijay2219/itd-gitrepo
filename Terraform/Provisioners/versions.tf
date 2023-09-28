terraform {
    required_version = "~> 1.5.7"
    required_providers {
        aws = {
            version = "~>5.17.0"
        }
    }

    backend "s3" {
        bucket = "my-s3-backend-143225"
        key = "main/terraform.tfstate"
        region = "us-east-2"
        dynamodb_table = "dynamo-statelocking-table"
    }
}