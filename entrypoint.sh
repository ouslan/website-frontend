#!/bin/bash

# Notify the user that the script is waiting for PostgreSQL to be ready
echo "Waiting for PostgreSQL to be ready..."

# Loop until PostgreSQL is accessible on port 5432
while ! nc -z db 5432; do
  sleep 1
done

# Notify the user that PostgreSQL is ready and migrations are starting
echo "PostgreSQL is up - running migrations..."

python manage.py migrate

python manage.py shell -c "\
from django.contrib.auth.models import User; \
user_exists = User.objects.filter(username='${DJANGO_SUPERUSER_USERNAME}').exists(); \
if not user_exists: \
    User.objects.create_superuser('${DJANGO_SUPERUSER_USERNAME}', '${DJANGO_SUPERUSER_EMAIL}', '${DJANGO_SUPERUSER_PASSWORD}')"

python manage.py makemigrations

python manage.py makemigrations

# Notify the user that Django server is starting
echo "Starting Django Server..."
exec "$@"
