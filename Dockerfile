FROM python:3.9-slim

WORKDIR /app

# Copy the requirements file early to leverage Docker caching
COPY requirements.txt /app/

RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

EXPOSE 5000

# Define environment variable for production (optional)
ENV FLASK_ENV=staging

# Run the application using Gunicorn for staging
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "application:application"]