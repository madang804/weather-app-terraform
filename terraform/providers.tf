provider "tfe" {
  token = "${TERRAFORM_TOKEN_app_terraform_io}"
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment = "stage"
      Name        = "WeatherApp"
    }
  }
}
