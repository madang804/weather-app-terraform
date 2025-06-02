
output "app_url" {
  value = "http://${aws_elastic_beanstalk_environment.env.endpoint_url}"
}

