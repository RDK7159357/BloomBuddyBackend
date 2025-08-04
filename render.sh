#!/bin/bash
# Render deployment script

# Install dependencies
pip install -r requirements.txt

# Start the application with Gunicorn
gunicorn --bind 0.0.0.0:$PORT ml-api-server:app
