#!/bin/bash
# Render deployment script

# Upgrade pip and setuptools first
pip install --upgrade pip setuptools wheel

# Install dependencies
pip install -r requirements.txt

# Start the application with Gunicorn
exec gunicorn --bind 0.0.0.0:$PORT ml-api-server:app
