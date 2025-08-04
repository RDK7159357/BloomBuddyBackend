#!/bin/bash
# Render deployment script

set -e  # Exit on any error

echo "Starting build process..."

# Upgrade pip and install build tools
python -m pip install --upgrade pip
pip install setuptools==68.2.2 wheel==0.41.3

# Try flexible requirements first, fall back to fixed if needed
if pip install -r requirements-flexible.txt; then
    echo "Installed with flexible requirements"
else
    echo "Flexible requirements failed, trying fixed requirements"
    pip install -r requirements.txt
fi

echo "Dependencies installed successfully"

# Start the application with Gunicorn
exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --timeout 120 ml-api-server:app
