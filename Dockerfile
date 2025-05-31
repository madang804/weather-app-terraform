FROM python:3.13.3-alpine3.22

WORKDIR /app

# Copy requirements.txt first for better caching
COPY requirements.txt .

RUN python -m pip install --upgrade pip && \
    python -m pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "application:application"]