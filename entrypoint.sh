#!/bin/sh

python manage.py migrate --no-input
python manage.py collectstatic --no-input
export DJANGO_SUPERUSER_EMAIL=bsdtimothy@gmail.com
export DJANGO_SUPERUSER_PASSWORD=password
export DJANGO_SUPERUSER_USERNAME=timothy
python manage.py createsuperuser --no-input
gunicorn mysite.wsgi:application --bind 0.0.0.0:8000
