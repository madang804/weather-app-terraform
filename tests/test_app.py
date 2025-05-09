import pytest
from application import application as app


@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client


def test_home_route(client):
    response = client.get('/')
    assert response.status_code == 200


def test_weather_endpoint(client):
    response = client.get('/api/v1.0/weather?location=London')
    assert response.status_code == 200
    assert b'weather' in response.data


def test_temperature_endpoint(client):
    response = client.get('/api/v1.0/temperature?location=Swindon')
    assert response.status_code == 200
    assert b'temperature' in response.data


def test_wind_endpoint(client):
    response = client.get('/api/v1.0/wind?location=Liverpool')
    assert response.status_code == 200
    assert b'wind' in response.data


def test_humidity_endpoint(client):
    response = client.get('/api/v1.0/humidity?location=Edinburgh')
    assert response.status_code == 200
    assert b'humidity' in response.data


def test_invalid_route(client):
    response = client.get('/invalid-route')
    assert response.status_code == 404
    assert b'Not Found' in response.data


def test_invalid_weather_endpoint(client):
    response = client.get('/api/v1.0/invalid-endpoint?location=Bristol')
    assert response.status_code == 404
    assert b'Not Found' in response.data


def test_unsupported_method(client):
    response = client.post('/api/v1.0/weather?location=Newcastle')
    assert response.status_code == 405
    assert b'Method Not Allowed' in response.data