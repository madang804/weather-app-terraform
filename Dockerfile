FROM python:3.13.3-alpine3.22

WORKDIR /app

# Copy the requirements file early to leverage Docker caching
COPY requirements.txt /app/

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . /app

EXPOSE 5000

# Run the application using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "application:application"]