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

The Flask app is deployed to AWS Elastic Beanstalk via the AWS Console. Below is a step-by-step guide.

#### 1. Zip Application Files
- Create a `.zip` file that includes `application.py`, `requirements.txt` and `Procfile`.

<details>
<summary>Windows</summary>

### Prerequisites
- 7-Zip installed.
  
  CMD
  ```cmd
  "C:\Program Files\7-Zip\7z.exe" a -tzip application.zip application.py requirements.txt Procfile
  ```
  PowerShell
  ```powershell
  & "C:\Program Files\7-Zip\7z.exe" a -tzip application.zip application.py requirements.txt Procfile
  ```
</details>

<details>
<summary>MacOS</summary>

### Prerequisites
- Zip installed.
  ```bash
  zip application.zip application.py requirements.txt Procfile
  ```
</details>

<details>
<summary>Linux</summary>

### Prerequisites
- Zip installed.
  ```bash
  zip application.zip application.py requirements.txt Procfile
  ```
</details>

#### 2. Log In to AWS Management Console
1. Go to the [AWS Elastic Beanstalk Console](https://console.aws.amazon.com/elasticbeanstalk).
2. Click **Create Application**.

#### 3. Create a New Elastic Beanstalk Application
1. Under **Application information** name the application (e.g., `WeatherApp`).
2. Under **Environment information**:
   - Choose a domain prefix (e.g., `weather-app`) and check availability.
   - Leave blank to auto-generate.
3. Under **Platform**:
   - Select **Python** and the appropriate **Platform Branch**.

#### 4. Upload Flask Application
1. Under **Application code**:
   - Select **Upload your code**
   - Set **Version label** to v1.0
   - Upload `.zip` file created earlier.
2. Click **Next**.
3. Under **Service access**:
   - Choose an **EC2 instance profile** from dropdown list.
   - If none listed, create a new IAM role with these policies:
     - AWSElasticBeanstalkWebTier
     - AWSElasticBeanstalkWorkerTier
     - AWSElasticBeanstalkMulticontainerDocker
   - Click `Refresh` to refresh the dropdown list to find the new IAM role .
4. Click **Skip to Review** or **Next** to continue through additional settings.
5. Click **Submit** to deploy.

#### 5. Monitor Deployment
- Wait until you see **Environment successfully launched**.

  ![eb-console.png](./png/console.png)

#### 6. Test API
1. Copy and paste app URL in browser (e.g., `http://weather-app.eu-west-2.elasticbeanstalk.com`).

   ![weather-app.png](./png/weather-app.png)

2. Test endpoints in browser.

   ![weather.png](./png/weather.png)

   ![temperature.png](./png/temperature.png)

   ![wind.png](./png/wind.png)

   ![humidity.png](./png/humidity.png)

4. Test endpoints in terminal (optional).

   ![curl-weather.png](./png/curl-weather.png)

   ![curl-temperature.png](./png/curl-temperature.png)

   ![curl-wind.png](./png/curl-wind.png)

   ![curl-humidity.png](./png/curl-humidity.png)

6. Clean Up
   1. Terminate Elastic Beanstalk Environment
      - Select your application environment from the `Environment` tab.
      - Click `Actions` and select `Terminate Environment`.
      - Confirm the termination.
   3. Delete Elastic Beanstalk Application
      - Select your application from the `Application` tab.
      - Click `Actions` and select `Delete Application`.
      - Confirm the deletion.
   4. Delete S3 Bucket
      - Go to S3 console.
      - Select the bucket (e.g., elasticbeanstalk-region-account_id)
      - Empty the bucket.
      - Select `Permissions` tab and delete `Bucket policy`.
      - Delete the bucket.

---

## Reference

- https://www.python.org
- https://flask.palletsprojects.com
- https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html

---

## License
This project is licensed under the MIT License. See [LICENSE](./LICENSE) for more details.

---






