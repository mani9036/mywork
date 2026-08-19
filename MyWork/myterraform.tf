terraform {
  required_version = ">= 1.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "m5.xlarge"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = var.instance_type
  key_name      = "my-key-pair"

  tags = {
    Name = "my_prod"
    Env  = "prod"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-prod-bucket"

  tags = {
    Name = "my-bucket"
  }
}

resource "aws_s3_bucket_versioning" "my_versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}