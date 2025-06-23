# Weather App with Terraform Deployment

![License](https://img.shields.io/badge/license-MIT-blue.svg)
A simple web API built with Python and Flask that provides weather-related information, deployed to AWS Elastic Beanstalk using Terraform.

## Project Overview

This project consists of:
- A Python Flask application that serves weather data via API endpoints
- Terraform infrastructure as code to deploy the app to AWS Elastic Beanstalk
- GitHub Actions CI/CD pipeline for automated testing and deployment
- Docker containerization for consistent deployment

## Features

- RESTful API endpoints for weather data
- Random weather data generation based on location parameter
- Infrastructure as Code with Terraform
- Automated CI/CD pipeline with GitHub Actions
- Multi-platform testing support
- Docker containerization

## API Endpoints

- `GET /` - Homepage
- `GET /api/v1.0/weather?location={location}` - Get complete weather data
- `GET /api/v1.0/temperature?location={location}` - Get temperature data
- `GET /api/v1.0/wind?location={location}` - Get wind data
- `GET /api/v1.0/humidity?location={location}` - Get humidity data

## Prerequisites

- Python 3.9+
- Docker
- Terraform
- AWS account with appropriate permissions
- GitHub account

## Installation

### Local Development

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/weather-app-terraform.git
   cd weather-app-terraform
   ```
2. Set up a virtual environment and install dependencies:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   pip install -r requirements.txt   
   ```
3. Run the application locally:
   ```bash
   flask run   
   ```

## Docker

1. Build the Docker image:
   ```bash
   docker build -t weather-app .   
   ```
2. Run the container:
   ```bash
   docker run -p 5000:5000 weather-app   
   ```

## Deployment

The project is configured with GitHub Actions to automatically:
- Run linting and tests
- Build and push Docker image
- Deploy to AWS Elastic Beanstalk using Terraform
- Test the deployed endpoints
- Clean up resources (optional)

## Manual Deployment with Terraform

1. Navigate to the terraform directory:
   ```bash
   cd terraform   
   ```
2. Initialise Terraform:
   ```bash
   terraform init   
   ```
3. Apply the configuration:
   ```bash
   terraform apply -auto-approve   
   ```

## CI/CD Pipeline

The GitHub Actions workflow performs the following steps:
- Linting: Runs Ruff linter on Python code
- Unit Testing: Runs pytest across multiple OS and Python versions
- Docker Build: Builds and pushes Docker image to Docker Hub
- Container Testing: Runs tests inside the built Docker container
- Terraform Deployment: Deploys infrastructure to AWS
- Endpoint Testing: Tests all API endpoints after deployment
- Clean-up: Optionally destroys resources after testing

## Environment Variables

Required environment variables for deployment:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- TF_TOKEN_app_terraform_io (Terraform Cloud API token)
- DOCKER_USERNAME
- DOCKER_PASSWORD

These should be set as GitHub Secrets in your repository settings.

## Testing

Run tests locally with:
   ```bash
   python -m pytest tests/ -v   
   ```

The CI pipeline includes comprehensive testing across:
- Multiple operating systems (Ubuntu, macOS, Windows)
- Multiple Python versions (3.9-3.13)
- Both host and container environments

## License

This project is licensed under the terms of the MIT License. See [LICENSE](./LICENSE) for more details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## Support

For support, please open an issue in the GitHub repository.
