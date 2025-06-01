terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.96.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment = "Production"
      Name        = "WeatherApp"
    }
  }
}

data "aws_caller_identity" "current" {}

# Create IAM Role
resource "aws_iam_role" "role" {
  name = "elasticbeanstalk-ec2role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# Create EC2 Instance Profile
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = aws_iam_role.role.name
  role = aws_iam_role.role.name
}

# Attach Policies to the IAM Role
resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier",
  ])

  policy_arn = each.value
  role       = aws_iam_role.role.name
}

# Create S3 Bucket to store Flask app image
resource "aws_s3_bucket" "app_bucket" {
  bucket = "${aws_elastic_beanstalk_application.app.name}-bucket-${data.aws_caller_identity.current.account_id}"
}

# Create S3 Bucket Object to store zipped Dockerrun.aws.json file
resource "aws_s3_object" "app_object" {
  bucket = aws_s3_bucket.app_bucket.id
  key    = "Dockerrun.aws.json.zip"
  source = "Dockerrun.aws.json.zip"
}

# Create Elastic Beanstalk Application
resource "aws_elastic_beanstalk_application" "app" {
  name        = var.app_name
  description = "Flask weather app"

  appversion_lifecycle {
    service_role          = aws_iam_role.role.arn
    max_count             = 128
    delete_source_from_s3 = true
  }
}

# Create a version of Flask app
resource "aws_elastic_beanstalk_application_version" "app_version" {
  name        = var.ver
  application = aws_elastic_beanstalk_application.app.name
  description = "application version created by terraform"
  bucket      = aws_s3_bucket.app_bucket.id
  key         = aws_s3_object.app_object.id
}

# Create Elastic Beanstalk Environment
resource "aws_elastic_beanstalk_environment" "env" {
  name                = var.env_name
  application         = aws_elastic_beanstalk_application.app.name
  cname_prefix        = "weather-app"
  version_label       = aws_elastic_beanstalk_application_version.app_version.name
  platform_arn        = "arn:aws:elasticbeanstalk:eu-west-2::platform/Docker running on 64bit Amazon Linux 2023/4.5.2"
  }
