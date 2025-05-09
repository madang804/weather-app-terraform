# Weather App

![License](https://img.shields.io/badge/license-MIT-blue.svg)  
A simple web API built with Python and Flask that provides weather-related information. This service is designed to allow other web applications to connect and retrieve random weather data for a location parameter.

---

## Table of Contents
1. [About the Project](#about-the-project)
2. [Endpoints](#endpoints)
3. [Getting Started](#getting-started)
4. [Deploying to AWS Elastic Beanstalk](#deploying-to-aws-elastic-beanstalk)
5. [Reference](#reference)
6. [License](#license)

---

## About the Project
This Flask-based web App provides four endpoints for weather-related information:
- `weather`
- `temperature`
- `wind speed and direction`
- `humidity`

The API is designed to simulate weather data for a given location.

---

## Endpoints

### 1. Weather
- **Endpoint:** `/weather`
- **Method:** `GET`
- **Query Parameters:**
  - `location` (required): The location for which weather data is requested.
- **Response:** A random weather description (e.g., sunny, cloudy, rainy).

### 2. Temperature
- **Endpoint:** `/temperature`
- **Method:** `GET`
- **Query Parameters:**
  - `location` (required): The location for which temperature data is requested.
- **Response:** A random temperature in celsius.

### 3. Wind Speed and Direction
- **Endpoint:** `/wind`
- **Method:** `GET`
- **Query Parameters:**
  - `location` (required): The location for which wind speed and direction data is requested.
- **Response:** A random wind speed (e.g., 15 kts) and direction (e.g., 45 deg).

### 4. Humidity
- **Endpoint:** `/humidity`
- **Method:** `GET`
- **Query Parameters:**
  - `location` (required): The location for which temperature data is requested.
- **Response:** A random humidity in percent.

---

## Getting Started

### Select your OS

<details>
<summary>Windows</summary>

### Prerequisites
- Windows 10
- Python (3.13.x) and pip (25.1.x) installed.
- Git (2.49.x) installed.
- Other versions may not work.

1. Clone the repository:
   ```cmd
   git clone https://github.com/madang804/weather-app.git
   ```
2. Navigate to project directory:
   ```cmd
   cd weather-app
   ```
3. Create a virtual environment:
   ```cmd
   python -m venv venv
   ```
4. Activate virtual environment:
   ```cmd
   venv\Scripts\activate
   ```
5. Install dependencies:
   ```cmd
   pip install -r requirements.txt
   ```
6. Run Flask app:
   ```cmd
   flask --app application run
   ```
7. Open a browser and visit `http://127.0.0.1:5000` to test API locally.
8. Deactivate virtual environment:
   ```cmd
   deactivate
   ```
</details>

<details>
<summary>MacOS</summary>

### Prerequisites
- Python and pip installed.
- Git installed.
- Not tested but should work fine.

1. Clone the repository:
   ```bash
   git clone https://github.com/madang804/weather-app.git
   ```
2. Navigate to project directory:
   ```bash
   cd weather-app
   ```
3. Create a virtual environment:
   ```bash
   python3 -m venv venv
   ```
4. Activate virtual environment:
   ```bash
   source venv/bin/activate
   ```
5. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
6. Run Flask app:
   ```bash
   gunicorn application:application
   ```
7. Open a browser and visit `http://127.0.0.1:5000` to test the API locally.
8. Deactivate virtual environment:
   ```bash
   deactivate
   ```
</details>

<details>
<summary>Linux</summary>

### Prerequisites
- Ubuntu 22.04.x LTS
- Python (3.10.x) and pip (22.0.x) installed.
- Git (2.34.x) installed.
- Other versions may not work.

1. Clone the repository:
   ```bash
   git clone https://github.com/madang804/weather-app.git
   ```
2. Navigate to project directory:
   ```bash
   cd weather-app
   ```
3. Create a virtual environment:
   ```bash
   python3 -m venv venv
   ```
4. Activate virtual environment:
   ```bash
   source venv/bin/activate
   ```
5. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
6. Run Flask app:
   ```bash
   gunicorn application:application
   ```
7. Open a browser and visit `http://127.0.0.1:5000` to test the API locally.
8. Deactivate virtual environment:
   ```bash
   deactivate
   ```
</details>

## Deploying to AWS Elastic Beanstalk

The Flask app is deployed to AWS Elastic Beanstalk via terraform (IaC). Below is a step-by-step guide.

#### 1. Zip Application Files
- Create a `.zip` file that includes `application.py`, `requirements.txt` and `Procfile`.

<details>
<summary>Windows</summary>

### Prerequisites
- terraform installed.
- awscli installed.
- curl installed.
- jq installed (optional).

1. Change to terraform directory
   ```bash
   cd terraform
   ```
1. Ensure `zip_app.sh` is executable.
   ```bash
   chmod +x zip_app.sh
   ```
2. Run these Terraform commands to deploy Flask app to AWS Elastic Beanstalk.
   ```bash
   terraform init
   terraform plan
   terraform apply -auto-approve
   ```
3. Test API
   ```bash
   curl -s http://weather-api.eu-west-2.elasticbeanstalk.com/api/v1.0/weather?location=london | jq .
   ```
   ```bash
   curl -s http://weather-api.eu-west-2.elasticbeanstalk.com/api/v1.0/temperature?location=london | jq .
   ```
   ```bash
   curl -s http://weather-api.eu-west-2.elasticbeanstalk.com/api/v1.0/wind?location=london | jq .
   ```
4. Run this command to destroy deployed AWS resources.
   ```bash
   terraform destroy -auto-approve
   ```
5. NOTE: AWS Elastic Beanstalk automatically creates an S3 bucket which is not managed by terraform code. AWS recommends to manually delete the bucket to avoid incurring charges.
   ```bash
   # Delete S3 bucket objects
   aws s3 rm "s3://$(aws s3 ls | awk '{print $3}')" --recursive
   
   # Delete S3 bucket policy
   aws s3api delete-bucket-policy --bucket "$(aws s3 ls | awk '{print $3}')"
   
   # Delete S3 bucket
   aws s3api delete-bucket --bucket "$(aws s3 ls | awk '{print $3}')"
   ```

---

## Reference

- https://www.python.org
- https://flask.palletsprojects.com
- https://developer.hashicorp.com/terraform
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs
- https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html

---

## License
This project is licensed under the MIT License. See [LICENSE](./LICENSE) for more details.

---






